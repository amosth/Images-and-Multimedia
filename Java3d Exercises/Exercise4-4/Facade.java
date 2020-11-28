package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;

public class Facade extends Group {
	protected TransformGroup[] colonneArray = new TransformGroup[6];
	
	public Facade(Appearance appearance) {
		for(int i=0; i<colonneArray.length; i++) {
			colonneArray[i] = new TransformGroup();
			Transform3D translation = new Transform3D();
			translation.setTranslation(new Vector3d(i*5-12.5,0.0f,0.0f));
			
			colonneArray[i].setTransform(translation);
			colonneArray[i].addChild(new Column(appearance));
			addChild(colonneArray[i]);
		}
		
		TransformGroup tgTetto = new TransformGroup();
		Transform3D tettoTranslation = new Transform3D();
		tettoTranslation.setTranslation(new Vector3d(0,0.0f,30f));
		
		tgTetto.setTransform(tettoTranslation);
		tgTetto.addChild(new Roof(appearance));	
		addChild(tgTetto);
	}
}
