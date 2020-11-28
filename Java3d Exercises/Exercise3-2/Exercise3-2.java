package Esercizio32;

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;

import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.geometry.ColorCube;
import com.sun.j3d.utils.universe.SimpleUniverse;

/**
 * ESERCIZIO:	3.2
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex32 extends Applet {
	int n;
	int degree;
	
	public Ex32(int n) {
		this.n = n;
		this.degree = 360/n;
		setLayout(new BorderLayout());
	
		GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();
		Canvas3D canvas3d = new Canvas3D(config);
		add("Center", canvas3d);
		
		BranchGroup scene = createSceneGraph();
		scene.compile();
		
		SimpleUniverse simpleU = new SimpleUniverse(canvas3d);
		simpleU.getViewingPlatform().setNominalViewingTransform();
		simpleU.addBranchGraph(scene);
	}
	
	/**
	 * Funzione che crea il sottografo
	 * @return il BranchGroup da aggiungere al SimpleUniverse
	 */
	public BranchGroup createSceneGraph() {
		BranchGroup bg = new BranchGroup();
		
		//Creazione trasformazioni per 'n' cubi
		Transform3D[] transformationsArray = new Transform3D[n];
		for(int i=0; i<n; i++) {
			transformationsArray[i] = new Transform3D();
			transformationsArray[i].setTranslation(new Vector3d(Math.cos(Math.toRadians(degree*i)), Math.sin(Math.toRadians(degree*i)), -3));
		}
		
		//Creazione TransformGroup per 'n' cubi
		TransformGroup[] tgArray = new TransformGroup[n];
		for(int i=0; i<n; i++) {
			tgArray[i] = new TransformGroup();
			tgArray[i].setTransform(transformationsArray[i]);
			tgArray[i].addChild(new ColorCube(0.2));
			bg.addChild(tgArray[i]);	//Aggiunta di 'n' nodi TransformGroup al BranchGroup
		}
		
		return bg;
	}
	
	public static void main(String[] args) {
		new MainFrame(new Ex32(8), 1024, 768);		//Indicare il numero di cubi desiderato come argomento di ManyCubes
	}
}
