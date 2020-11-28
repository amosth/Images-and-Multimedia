package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.geometry.*;

public class Side extends Group {
	protected TransformGroup tgSx;
	protected TransformGroup tgDx;
	protected Box latoSinistro;
	protected Box latoDestro;
	
	public Side(Appearance appearance) {
		TransformGroup[] latiTg = new TransformGroup[24];
		
		for(int i=0; i<latiTg.length; i++) {
			latiTg[i] = new TransformGroup();
			
			Transform3D translation = new Transform3D();
			if(i<latiTg.length/2) {
				translation.setTranslation(new Vector3d(-12.5,0.0,-(i+1)*5));
			} else {
				translation.setTranslation(new Vector3d(12.5,0.0,(-(i+1)*5)+(latiTg.length/2*5)));
			}
			
			latiTg[i].setTransform(translation);
			latiTg[i].addChild(new Column(appearance));
			addChild(latiTg[i]);
		}
		
		/* ---------------------------------- LATI -------------------------------- */
		tgSx = new TransformGroup();
		tgDx = new TransformGroup();
		latoSinistro = new Box(1.5f,2f,30f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		latoDestro = new Box(1.5f,2f,30f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D translationSx = new Transform3D();
		translationSx.setTranslation(new Vector3d(-12.5f, 13.0f, 0f));
		
		Transform3D translationDx = new Transform3D();
		translationDx.setTranslation(new Vector3d(12.5f, 13.0f, 0f));
		
		tgSx.setTransform(translationSx);
		tgDx.setTransform(translationDx);
		
		tgSx.addChild(latoSinistro);
		tgDx.addChild(latoDestro);
		
		addChild(tgSx);
		addChild(tgDx);
		/* ------------------------------------------------------------------------ */
	}
}
