package Esercizio43;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import javax.media.j3d.*;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
import javax.vecmath.Vector3f;
import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.geometry.*;
import com.sun.j3d.utils.image.TextureLoader;
import com.sun.j3d.utils.universe.SimpleUniverse;

/**
 * ESERCIZIO:	4.3
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex43 extends Applet {
	protected static Appearance appearance = new Appearance();
	protected static Material material = new Material();

	public Ex43() {
		setLayout(new BorderLayout());
		
		GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
		Canvas3D canvas3d = new Canvas3D(config);
		add("Center", canvas3d);
		
		BranchGroup scene = createSceneGraph();
		scene.compile();
		
		SimpleUniverse simpleU = new SimpleUniverse(canvas3d);
		setViewPoint(simpleU, canvas3d, scene);
		simpleU.addBranchGraph(scene);
	}
	
	/**
	 * Funzione che definisce il punto di vista
	 */
	public static void setViewPoint(SimpleUniverse simpleU, Canvas3D canvas3d, BranchGroup scene) {  
		
		View view = simpleU.getViewer().getView();  //Ottenimento View del SimpleUniverse
		double fieldOfView = view.getFieldOfView(); //Ottenimento campo visivo di View

		/* ------------------------------------ LOOKAT ------------------------------------ */
		Transform3D viewTransform = new Transform3D(); 		//Creazione trasformazione
		double distance = 1.0/Math.tan(fieldOfView/2.0);	//Definizione della distanza

		viewTransform.lookAt(new Point3d(0, 0, distance*8),
							 new Point3d(0, 0, 0),
							 new Vector3d(0, 1, 0));
		
		viewTransform.invert();
		
		//Applicazione della trasformazione al TransformGroup di View
		TransformGroup tg = simpleU.getViewingPlatform().getViewPlatformTransform();
		tg.setTransform(viewTransform);
		/* -------------------------------------------------------------------------------- */
		
		/* //Alternativamente a lookAt()
		simpleU.getViewingPlatform().setNominalViewingTransform();
		*/
		
		//Impostazione distanza dal piano frontale e dal piano posteriore
		view.setFrontClipDistance(0.1);
		view.setBackClipDistance(50.0);
				
		//Impostazione del campo visivo
		view.setFieldOfView(Math.PI/4);
				
		//Impostazione del tipo di proiezione
		view.setProjectionPolicy(View.PERSPECTIVE_PROJECTION);
		//View.setProjectionPolicy(View.PARALLEL_PROJECTION);
	}
	
 	/**
 	 * Funzione che crea il sottografo
 	 * @return il BranchGroup da aggiungere al SimpleUniverse
 	 */
	public BranchGroup createSceneGraph() {
		BranchGroup bg = new BranchGroup();
		TransformGroup[] tg = createSubGraph();
		
		for(int i=0; i<tg.length; i++) {
			tg[i].setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
			tg[i].setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
			bg.addChild(tg[i]);		//Aggiunta del TransformGroup al BranchGroup
		}
		
		lightDefinition(bg);
	
		return bg; 
	}

	/**
	 * Funzione che crea il TransformGroup
	 * @return il TransformGroup da aggiungere al BranchGroup
	 */
	public TransformGroup[] createSubGraph() {
		TransformGroup tgEarth = new TransformGroup();	//Creazione TransformGroup
		TransformGroup tgMoon = new TransformGroup();	//Creazione TransformGroup
		
		//Caricamento delle texture
		TextureLoader textureLoaderEarth = new TextureLoader("src/img/earth.jpg", null);
		TextureLoader textureLoaderMoon = new TextureLoader("src/img/moon.jpg", null);
		
		//Inizializzazione degli oggetti Texture
		Texture textureEarth = textureLoaderEarth.getTexture();
		Texture textureMoon = textureLoaderMoon.getTexture();
		  
		TextureAttributes textureAttrEarth = new TextureAttributes();
		textureAttrEarth.setTextureMode(TextureAttributes.MODULATE);
		TextureAttributes textureAttrMoon = new TextureAttributes();
		textureAttrMoon.setTextureMode(TextureAttributes.MODULATE);
		
		//Specificazione delle Appearance
		appearance.setTexture(textureEarth);
		appearance.setTextureAttributes(textureAttrEarth);
		appearance.setMaterial(material);
		
		Appearance moonAppearance = new Appearance();
		moonAppearance.setTexture(textureMoon);
		moonAppearance.setTextureAttributes(textureAttrMoon);
		moonAppearance.setMaterial(material);

		//Creazione di una primitiva completa di coordinate per la texture
		Sphere earth = new Sphere(1.0f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		Sphere moon = new Sphere(0.25f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, moonAppearance);
		
		Transform3D translationMoon = new Transform3D();
		translationMoon.setTranslation(new Vector3d(-5d, 0.0d, 0.0d));
		tgMoon.setTransform(translationMoon);
		
		Rotation moonRotation = new Rotation(tgMoon);	
		BoundingSphere bounds = new BoundingSphere(new Point3d(0.0,0.0,0.0), 1000d);
		moonRotation.setSchedulingBounds(bounds);
		tgMoon.addChild(moonRotation);
	
		//Caricamento della texture
		TextureLoader textureLoaderUniverse = new TextureLoader("src/img/texture/universe.jpg", this);
		ImageComponent2D universe = textureLoaderUniverse.getImage();
		
		Background myBg = new Background();
		myBg.setImage(universe);
		myBg.setImageScaleMode(Background.SCALE_FIT_MAX);
		BoundingSphere bgBounds = new BoundingSphere(new Point3d(), 1000.0d);
		myBg.setApplicationBounds(bgBounds);
	
		tgMoon.addChild(moon);
		tgEarth.addChild(earth);
		tgEarth.addChild(myBg);
		
		return new TransformGroup[] {tgEarth, tgMoon};
	}
	
	/**
	 * Funzione che definisce il comportamento delle luci
	 */
	private void lightDefinition(BranchGroup bg){
		//Definizione dello spazio d'illuminazione
		BoundingSphere bounds = new BoundingSphere(new Point3d(0.d,0.d,0.d), 20.0d);
		
		//Creazione sorgente di luce
		AmbientLight ambient = new AmbientLight();
		ambient.setInfluencingBounds(bounds);
		//bg.addChild(ambient); //Aggiunta AmbientLight al BranchGroup
		
		DirectionalLight directional = new DirectionalLight();
		directional.setInfluencingBounds(bounds);
		directional.setDirection(new Vector3f(-1.0f, -1.0f, -1.0f));
		bg.addChild(directional); //Aggiunta DirectionalLight al BranchGroup
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex43(), 1024, 400);
	}
}
