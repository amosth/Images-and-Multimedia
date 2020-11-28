package Esercizio42;

import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;

public class Facade extends Group {
	
	public Facade() {
		TransformGroup[] colonneArray = new TransformGroup[6];
		
		for(int i=0; i<colonneArray.length; i++) {
			colonneArray[i] = new TransformGroup();
			Transform3D translation = new Transform3D();
			translation.setTranslation(new Vector3d(i*5-12.5,0.0f,0.0f));
			
			colonneArray[i].setTransform(translation);
			colonneArray[i].addChild(new Column());
			addChild(colonneArray[i]);
		}
		
		TransformGroup tetto = new TransformGroup();
		
		tetto.addChild(new Roof());
		addChild(tetto);
	}
}
