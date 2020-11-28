package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.geometry.*;

public class Interior extends Group {
	protected TransformGroup[] colonneTg = new TransformGroup[12];
	
	public Interior(Appearance appearance) {
		Column[] colonneArray = new Column[12];
		
		for(int i=0; i<colonneArray.length/2; i++) {
			colonneTg[i] = new TransformGroup();
			colonneArray[i] = new Column(appearance);
			colonneTg[i].addChild(colonneArray[i]);
			
			Transform3D translation = new Transform3D();
			if(i<3) {
				translation.setTranslation(new Vector3d(i*5-5,0,-10));
			} else {
				translation.setTranslation(new Vector3d((i%3*5)-5,0,-50));
			}
			
			colonneTg[i].setTransform(translation);
			addChild(colonneTg[i]);
		}
		
		for(int i=0; i<colonneArray.length/2; i++) {
			int j = i+colonneArray.length/2; 
			
			colonneTg[j] = new TransformGroup();
			colonneArray[j] = new Column(appearance);
			colonneTg[j].addChild(colonneArray[j]);
			
			Transform3D translation = new Transform3D();
			if(i<3) {
				translation.setTranslation(new Vector3d(5,0,i*10-40));
			} else {
				translation.setTranslation(new Vector3d(-5,0,(i%3*10-40)));
			}
			
			colonneTg[j].setTransform(translation);
			addChild(colonneTg[j]);
		}
		
		Box bloccoSopra1 = new Box(7.4f,0.5f,1.5f,Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS,appearance);
		Box bloccoSopra2 = new Box(7.4f,0.5f,1.5f,Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS,appearance);
		
		TransformGroup bloccoTg1 = new TransformGroup();
		TransformGroup bloccoTg2 = new TransformGroup();
		
		Transform3D translationBlocco1 = new Transform3D();
		Transform3D translationBlocco2 = new Transform3D();
		
		translationBlocco1.setTranslation(new Vector3d(0,11.5,-20));
		translationBlocco2.setTranslation(new Vector3d(0,11.5,20));
		bloccoTg1.setTransform(translationBlocco1);
		bloccoTg2.setTransform(translationBlocco2);
		
		bloccoTg1.addChild(bloccoSopra1);
		bloccoTg2.addChild(bloccoSopra2);
		addChild(bloccoTg1);
		addChild(bloccoTg2);
		
	}
}
