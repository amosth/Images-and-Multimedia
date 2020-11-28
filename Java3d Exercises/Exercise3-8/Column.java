package Esercizio38;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Material;
import javax.media.j3d.PolygonAttributes;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Color3f;
import javax.vecmath.Vector3d;

import com.sun.j3d.utils.geometry.*;

public class Column extends Group {
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	protected TransformGroup abacoTg;
	protected TransformGroup echinoTg;
	protected TransformGroup fustoTg;
	protected Box abaco;
	protected Frustum echino;
	protected Cylinder fusto;

	public Column() {
		appearance.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_FILL, PolygonAttributes.CULL_NONE, 0));
		material.setAmbientColor(new Color3f(0.40f, 0.36f, 0.30f));
		material.setDiffuseColor(new Color3f(0.50f, 0.48f, 0.42f));
		appearance.setMaterial(material);

		/* ------------------------------ ABACO ----------------------------- */
		abacoTg = new TransformGroup();
		abaco = new Box(1.5f,0.5f,1.5f, appearance);

		Transform3D abacoTranslation = new Transform3D();
		abacoTranslation.setTranslation(new Vector3d(0f, 6f, 0f));

		abacoTg.setTransform(abacoTranslation);
		abacoTg.addChild(abaco);
		/* ------------------------------------------------------------------ */

		/* ----------------------------- ECHINO ----------------------------- */
		echinoTg = new TransformGroup();
		echino = new Frustum(3000, appearance);

		Transform3D echinoRotation = new Transform3D();
		Transform3D echinoTranslation = new Transform3D();

		echinoRotation.rotX(-Math.PI/2);
		echinoTranslation.setTranslation(new Vector3d(0f, 5f, 0f));
		echinoTranslation.mul(echinoRotation);

		echinoTg.setTransform(echinoTranslation);
		echinoTg.addChild(echino);
		/* ------------------------------------------------------------------ */

		/* ------------------------------ FUSTO ----------------------------- */
		fustoTg = new TransformGroup();
		fusto = new Cylinder(1f,9f, appearance);

		Transform3D fustoTranslation = new Transform3D();
		fustoTranslation.setTranslation(new Vector3d(0f, 0f, 0f));

		fustoTg.setTransform(fustoTranslation);
		fustoTg.addChild(fusto);
		/* ------------------------------------------------------------------ */

		addChild(abacoTg);
		addChild(fustoTg);
		addChild(echinoTg);
	}
}
