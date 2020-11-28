package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.geometry.*;

public class Column extends Group {
	protected TransformGroup abacoTg;
	protected TransformGroup fustoTg;
	protected TransformGroup echinoTg;
	protected Box abaco;
	protected Cylinder fusto;
	protected Frustum echino;
	
	public Column(Appearance appearance) {
		
		/* ------------------------------ ABACO ----------------------------- */
		abacoTg = new TransformGroup();
		abaco = new Box(1.5f,0.5f,1.5f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D abacoTranslation = new Transform3D();
		abacoTranslation.setTranslation(new Vector3d(0f, 10.5f, 30f));
		
		abacoTg.setTransform(abacoTranslation);
		abacoTg.addChild(abaco);
		/* ------------------------------------------------------------------ */
		
		/* ----------------------------- ECHINO ----------------------------- */
		echinoTg = new TransformGroup();
		echino = new Frustum(3000, appearance);
		
		Transform3D echinoRotation = new Transform3D();
		Transform3D echinoTranslation = new Transform3D();
		
		echinoRotation.rotX(-Math.PI/2);
		echinoTranslation.setTranslation(new Vector3d(0f, 9.5f, 30f));
		echinoTranslation.mul(echinoRotation);
		
		echinoTg.setTransform(echinoTranslation);
		echinoTg.addChild(echino);
		/* ------------------------------------------------------------------ */
		
		/* ------------------------------ FUSTO ----------------------------- */
		fustoTg = new TransformGroup();
		fusto = new Cylinder(1f, 9f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D fustoTranslation = new Transform3D();
		fustoTranslation.setTranslation(new Vector3d(0f, 4.5f, 30f));
		
		fustoTg.setTransform(fustoTranslation);
		fustoTg.addChild(fusto);
		/* ------------------------------------------------------------------ */
		
		addChild(abacoTg);
		addChild(fustoTg);
		addChild(echinoTg);
	}
}
