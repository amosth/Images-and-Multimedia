package Esercizio34;

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
 * ESERCIZIO:	3.4
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex34 extends Applet {

	public Ex34() {
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

		viewTransform.lookAt(new Point3d(0, 0, distance*2),
				 			 new Point3d(0, 0, 0),
				 			 new Vector3d(0, 1, 0));
		
		viewTransform.invert();
		
		//Applicazione della trasformazione al TransformGroup di View
		TransformGroup tg = simpleU.getViewingPlatform().getViewPlatformTransform();
		tg.setTransform(viewTransform);
		/* -------------------------------------------------------------------------------- */
		
		if(compatMode) {
			view.setCompatibilityModeEnable(compatMode);
			Transform3D projection = new Transform3D();
			
			//Proiezione ortografica con diverse profondità
	        projection.ortho(-2, 2, -2, 2, 0.1, 20);
	        
			/* //Proiezione prospettica con diverse aperture angolari e distanze focali
	        double ratio = 1024.0/768.0;
			projection.perspective(Math.PI/4, ratio, 0.1, 20.0);
			//projection.perspective(Math.PI/4, ratio, 3, 30.0);
			*/
	        
	        view.setLeftProjection(projection);
		}
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
		new MainFrame(new Ex34(), 1024, 768);
	}
}
