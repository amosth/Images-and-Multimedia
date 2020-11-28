package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;

import com.sun.j3d.utils.geometry.*;

public class Ground extends Group {
	
	public Ground(Appearance appearance) {
		Box base = new Box(13.5f,0.5f,31.0f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		TransformGroup tg = new TransformGroup();
		
		Transform3D translation = new Transform3D();
		translation.setTranslation(new Vector3d(0,-0.5d,0));
		
		tg.setTransform(translation);
		tg.addChild(base);	
		addChild(tg);
	}
}
