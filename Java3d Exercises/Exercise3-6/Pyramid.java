package Esercizio36;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Material;
import javax.media.j3d.PolygonAttributes;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Color3f;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;

public class Pyramid extends Group {
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	protected TransformGroup[] tgArray;
	protected Frustum[] tronchiArray;
	
	public Pyramid(int amount) {
		appearance.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_LINE, PolygonAttributes.CULL_NONE, 0));
		appearance.setMaterial(material);
		
		tronchiArray = new Frustum[amount];
		tgArray = new TransformGroup[amount];

		for(int i=0; i<amount; i++) {
			int a = i+1;
			
			Point3d[] pts = {
				new Point3d(-a*2, -0.5, a),
				new Point3d(-a*2, -0.5, -a),
				new Point3d(a*2, -0.5, -a),
				new Point3d(a*2, -0.5, a),
				new Point3d(-a*2+Math.sin(Math.toRadians(35)), 0.5, a),
				new Point3d(-a*2+Math.sin(Math.toRadians(35)), 0.5, -a),
				new Point3d(a*2-Math.sin(Math.toRadians(35)), 0.5, -a),
				new Point3d(a*2-Math.sin(Math.toRadians(35)), 0.5, a)
			};
			
			tronchiArray[i] = new Frustum(pts);
			tronchiArray[i].setAppearance(appearance);
			
			Transform3D translation = new Transform3D();
			translation.setTranslation(new Vector3d(0, amount-a, 0));
			
			tgArray[i] = new TransformGroup();
			tgArray[i].setTransform(translation);
			tgArray[i].addChild(tronchiArray[i]);
			addChild(tgArray[i]);
			
		}
	}
}
