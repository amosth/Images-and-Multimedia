package Esercizio42;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import javax.media.j3d.AmbientLight;
import javax.media.j3d.BoundingSphere;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.DirectionalLight;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.media.j3d.View;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
import javax.vecmath.Vector3f;
import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.behaviors.mouse.MouseRotate;
import com.sun.j3d.utils.universe.*;

/**
 * ESERCIZIO:	4.2
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex42 extends Applet {

	public Ex42() {
		setLayout(new BorderLayout());
		
		GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
		Canvas3D canvas3d = new Canvas3D(config);
		add("Center", canvas3d);
		
		BranchGroup scene = createSceneGraph();
		scene.compile();
		
		SimpleUniverse simpleU = new SimpleUniverse(canvas3d);	
		setViewPoint(simpleU, canvas3d, scene, true);
		simpleU.addBranchGraph(scene);
	}
	
	/**
	 * Funzione che definisce il punto di vista
	 */
	public static void setViewPoint(SimpleUniverse simpleU, Canvas3D canvas3d, BranchGroup scene, boolean compatMode) {  
		
		View view = simpleU.getViewer().getView();  //Ottenimento View del SimpleUniverse
		double fieldOfView = view.getFieldOfView(); //Ottenimento campo visivo di View

		/* ------------------------------------ LOOKAT ------------------------------------ */
		Transform3D viewTransform = new Transform3D(); 		//Creazione trasformazione
		double distance = 1.0/Math.tan(fieldOfView/2.0);	//Definizione della distanza

		viewTransform.lookAt(new Point3d(0, 8, distance*25),
							 new Point3d(0, 8, 0),
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
		TransformGroup tg = createSubGraph();
		
		MouseRotate myMouseRotate = new MouseRotate();
		myMouseRotate.setSchedulingBounds(new BoundingSphere(new Point3d(0.d,0.d,0.d),1000.0d));
		myMouseRotate.setTransformGroup(tg);
		
		//Costruzione della scena
		bg.addChild(tg);
		bg.addChild(myMouseRotate);
		lightDefinition(bg);
		
		return bg; 
	}
	
	/**
	 * Funzione che crea il TransformGroup
	 * @return il TransformGroup da aggiungere al BranchGroup
	 */
	public TransformGroup createSubGraph() {
		TransformGroup transform = new TransformGroup();	//Creazione TransformGroup
		
		transform.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		transform.setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
		
		Facade facciata = new Facade();
		transform.addChild(facciata);
		
		return transform;
	}
	
	/**
	 * Funzione che definisce il comportamento delle luci
	 */
	private void lightDefinition(BranchGroup bg) {
		//Definizione dello spazio d'illuminazione
		BoundingSphere bounds = new BoundingSphere(new Point3d(0.d,0.d,0.d), 20.0d);
		
		//Creazione sorgente di luce
		AmbientLight ambient = new AmbientLight();
		ambient.setInfluencingBounds(bounds);
		bg.addChild(ambient); //Aggiunta AmbientLight al BranchGroup
		
		DirectionalLight directional = new DirectionalLight();
		directional.setInfluencingBounds(bounds);
		directional.setDirection(new Vector3f(1.0f, 0.0f, -1.0f));
		bg.addChild(directional); //Aggiunta DirectionalLight al BranchGroup
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex42(), 1000, 900);
	}
}
