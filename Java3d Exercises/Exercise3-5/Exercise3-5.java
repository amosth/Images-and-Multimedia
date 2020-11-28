package Esercizio35;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.media.j3d.View;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.geometry.ColorCube;
import com.sun.j3d.utils.universe.*;

/**
 * ESERCIZIO:	3.5
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex35 extends Applet {

	public Ex35() {
		setLayout(new BorderLayout());
		
		GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
		Canvas3D canvas3d = new Canvas3D(config);
		add("Center", canvas3d);
		
		BranchGroup scene = createSceneGraph();
		scene.compile();
		
		SimpleUniverse simpleU = new SimpleUniverse(canvas3d);
		setViewPoint(simpleU, canvas3d, scene, false);
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

		viewTransform.lookAt(new Point3d(0, 0, distance*2),
				 			 new Point3d(0, 0, 0),
				 			 new Vector3d(0, 1, 0));
		
		viewTransform.invert();
		
		//Applicazione della trasformazione al TransformGroup di View
		TransformGroup tg = simpleU.getViewingPlatform().getViewPlatformTransform();
		tg.setTransform(viewTransform);
		/* -------------------------------------------------------------------------------- */
		
		//Impostazione distanza dal piano frontale e dal piano posteriore
		view.setFrontClipDistance(1.1);
		view.setBackClipDistance(10.0);

		//Impostazione del campo visivo
		view.setFieldOfView(Math.PI/4);
		
		//Impostazione del tipo di proiezione
		view.setProjectionPolicy(View.PERSPECTIVE_PROJECTION);
		//view.setProjectionPolicy(View.PARALLEL_PROJECTION);
	}
	
	/**
	 * Funzione che crea il sottografo
	 * @return il BranchGroup da aggiungere al SimpleUniverse
	 */
	public BranchGroup createSceneGraph() {		
		BranchGroup bg = new BranchGroup();
		TransformGroup tg = createSubGraph();
		bg.addChild(tg);	//Aggiunta del TransformGroup al BranchGroup
		
		return bg; 
	}
	
	/**
	 * Funzione che crea il TransformGroup
	 * @return il TransformGroup da aggiungere al BranchGroup
	 */
	public TransformGroup createSubGraph() {	
		TransformGroup tg = new TransformGroup();	//Creazione TransformGroup
		
		//Traslazione del cubo
		Transform3D translation = new Transform3D();
		translation.setTranslation(new Vector3d(0.4,0,0));
		
		//Rotazione del cubo
		Transform3D rotX = new Transform3D();
		rotX.rotX(Math.toRadians(45));
		
		//Diversa profondità per Punto 1
		Transform3D rotY = new Transform3D();
		rotY.rotY(Math.toRadians(60));
		rotX.mul(rotY);
		
		
		translation.mul(rotX);
		tg.setTransform(translation);
		tg.addChild(new ColorCube(0.3));
		
		return tg;
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex35(), 1024, 768);
	}
}
