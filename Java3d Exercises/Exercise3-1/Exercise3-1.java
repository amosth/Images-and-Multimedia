package Esercizio31;

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
 * ESERCIZIO:	3.1
 * AUTORE: 		Amos Cappellaro
 * MATRICOLA:	134059
 */
public class Ex31 extends Applet {

     public Ex31() {
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
          TransformGroup tg = createSubGraph();
          bg.addChild(tg);
          return bg;
     }

 	/**
 	 * Funzione che crea il TransformGroup
 	 * @return il TransformGroup da aggiungere al BranchGroup
 	 */
     public TransformGroup createSubGraph() {
    	 /* ---------------------------------- TRASLAZIONI ---------------------------------- */
          Transform3D translation = new Transform3D();
          translation.setTranslation(new Vector3d(0.6, 0, 0));         //Per valori positivi della x
          //translation.setTranslation(new Vector3d(-0.6, 0, 0));      //Per valori negativi della x
          //translation.setTranslation(new Vector3d(0, 0.4, 0));       //Per valori positivi della y
          //translation.setTranslation(new Vector3d(0, -0.4, 0));      //Per valori negativi della y
          //translation.setTranslation(new Vector3d(0, 0, 0.6));       //Per valori positivi della z
          //translation.setTranslation(new Vector3d(0, 0, -0.6));      //Per valori negativi della z
          //translation.setTranslation(new Vector3d(0.9, -0.4, -0.8)); //Traslazione per vedere il cubo in basso a dx e risulti più piccolo
          /* -------------------------------------------------------------------------------- */

          /* ---------------------------------- ROTAZIONI ----------------------------------- */
          Transform3D rotate = new Transform3D();
          rotate.rotX(Math.PI/2.0d);							  //Per valori positivi della x
          //rotate.rotX(-Math.PI);							  	  //Per valori negativi della x
          //rotate.rotY(Math.PI/2.0d);							  //Per valori positivi della y
          //rotate.rotY(-Math.PI/4.0d);							  //Per valori negativi della y
          //rotate.rotZ(Math.PI/4.0d);							  //Per valori positivi della z
          /*
          Transform3D composed = new Transform3D();	 			  //Per valori negativi della z
          rotate.rotZ(-Math.PI/4.0d);
          composed.rotY(-Math.PI/4.0d);
          rotate.mul(composed); //combinazione
          */
          /* -------------------------------------------------------------------------------- */
          
          /* ---------------------------------- SCALATURE ----------------------------------- */
          Transform3D scale = new Transform3D();
          scale.setScale(new Vector3d(2d,1d,1d));			  	 //Per valori positivi della x
          //scale.setScale(new Vector3d(-2d,1d,1d));		  	 //Per valori negativi della x
          //scale.setScale(new Vector3d(1d,2d,1d));		  	  	 //Per valori positivi della y
          //scale.setScale(new Vector3d(1d,-2d,1d));		  	 //Per valori negativi della y

          /*
          Transform3D composed = new Transform3D();	 		  	 //Per valori positivi della z
          rotate.rotX(Math.PI/4.0d);
          composed.rotY(Math.PI/4.0d);
          rotate.mul(composed); //combinazione
          scale.setScale(new Vector3d(1d,1d,5d));
          scale.mul(rotate);
          */
          
          /*
          Transform3D composed = new Transform3D();	 		  	 //Per valori negativi della z
          rotate.rotX(Math.PI/4.0d);
          composed.rotY(Math.PI/4.0d);
          rotate.mul(composed); //combinazione
          scale.setScale(new Vector3d(1d,1d,-5d));
          scale.mul(rotate);
          */
          /* -------------------------------------------------------------------------------- */
          
          TransformGroup tg = new TransformGroup();
          tg.setTransform(translation);						  //decommentare per applicare traslazioni
          //transform.setTransform(rotate);						  //decommentare per applicare rotazioni
          //transform.setTransform(scale);						  //decommentare per applicare scalature
          tg.addChild(new ColorCube(0.2));

          return tg;
     }
     
     public static void main(String[] args) {
         new MainFrame(new Ex31(), 1024, 768);
    }
}
