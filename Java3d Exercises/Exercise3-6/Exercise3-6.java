package Esercizio36;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import javax.media.j3d.BoundingSphere;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.media.j3d.View;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.behaviors.mouse.MouseRotate;
import com.sun.j3d.utils.universe.*;

/**
 * ESERCIZIO:	3.6
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex36 extends Applet {

	public Ex36() {
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

		viewTransform.lookAt(new Point3d(0, 0, distance*20),
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
		TransformGroup tg = createSubGraph();
		
		//Creazione del behavior per ruotare l'oggetto
		MouseRotate myMouseRotate = new MouseRotate(tg);
		
		//Impostazione di un raggio d'azione del behavior
		myMouseRotate.setSchedulingBounds(new BoundingSphere());
		
		//Costruzione della scena
		bg.addChild(myMouseRotate);
		bg.addChild(tg);		//Aggiunta del TransformGroup al BranchGroup
		
		return bg;
	}
	
	/**
	 * Funzione che crea il TransformGroup
	 * @return il TransformGroup da aggiungere al BranchGroup
	 */
	public TransformGroup createSubGraph() {
		TransformGroup tg = new TransformGroup();	//Creazione TransformGroup
		
		tg.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		tg.setCapability(TransformGroup.ALLOW_TRANSFORM_READ);
		
		Pyramid pyramid = new Pyramid(5);
		tg.addChild(pyramid);
		
		return tg;
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex36(), 1024, 768);
	}
}
