package Esercizio37;

import javax.media.j3d.Appearance;
import javax.media.j3d.ColoringAttributes;
import javax.media.j3d.Group;
import javax.media.j3d.Material;
import javax.media.j3d.PolygonAttributes;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Color3f;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.geometry.Primitive;
import com.sun.j3d.utils.geometry.Sphere;

public class SphereGroup extends Group {
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	protected TransformGroup[] tgArray;
	protected Sphere[] sphereArray;
	
	public SphereGroup(int numT) {
		appearance.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_FILL,PolygonAttributes.CULL_FRONT,0));
		appearance.setColoringAttributes(new ColoringAttributes(new Color3f(0.1f, 0.1f, 0.1f),ColoringAttributes.NICEST));
		
		material.setShininess(1f);
		appearance.setMaterial(material);
		
		tgArray = new TransformGroup[numT];
		sphereArray = new Sphere[numT];

		int row = -1;
		
		for(int i=0; i<numT; i++) {
			if(i%5==0) {	
				row++;	
			}
						
			sphereArray[i] = new Sphere(0.3f, Primitive.GENERATE_NORMALS, appearance);
			
			Transform3D traslation = new Transform3D();
			traslation.setTranslation(new Vector3d((i%5)-2f, row-2f, 0));
			
			tgArray[i] = new TransformGroup();
			tgArray[i].setTransform(traslation);
			tgArray[i].addChild(sphereArray[i]);
			addChild(tgArray[i]);
		}
	}
}
