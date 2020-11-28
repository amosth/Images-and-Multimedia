package Esercizio33;

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
 * ESERCIZIO:	3.3
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex33 extends Applet {

	public Ex33() {
		setLayout(new BorderLayout());
		
		GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
		Canvas3D canvas3d = new Canvas3D(config);
		add("Center", canvas3d);
		
		BranchGroup scene = createSceneGraph();
		scene.compile();
		
		SimpleUniverse simpleU = new SimpleUniverse(canvas3d);
		
		View view = simpleU.getViewer().getView();  //Ottenimento View del SimpleUniverse
		double fieldOfView = view.getFieldOfView(); //Ottenimento campo visivo di View
		
		/* ------------------------------------ LOOKAT ------------------------------------ */
		Transform3D viewTransform = new Transform3D(); 		//Creazione trasformazione
		double distance = 1.0/Math.tan(fieldOfView/2.0);	//Definizione della distanza
		viewTransform.setTranslation(new Vector3d(0.0, 0.0, distance));

		//1 punto di fuga 
		viewTransform.lookAt(new Point3d(0, 0, distance),
							 new Point3d(0, 0, 0),
							 new Vector3d(0, 1, 0));
		
		
		/* //2 punti di fuga 
		viewTransform.lookAt(new Point3d(distance, 0, distance),
							 new Point3d(0, 0, 0),
							 new Vector3d(0, 1, 0));
		*/
		
		/* //3 punti di fuga 
		viewTransform.lookAt(new Point3d(distance, distance, distance),
							 new Point3d(0, 0, 0),
							 new Vector3d(0, 1, 0));
		*/
		
		viewTransform.invert();
		
		//Applicazione della trasformazione al TransformGroup di View
		TransformGroup tg = simpleU.getViewingPlatform().getViewPlatformTransform();
		tg.setTransform(viewTransform);
		/* -------------------------------------------------------------------------------- */
		
		simpleU.addBranchGraph(scene);
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
		tg.addChild(new ColorCube(0.2));	
		
		return tg;
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex33(), 1024, 768);
	}
}
