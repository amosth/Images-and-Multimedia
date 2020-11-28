package Esercizio44;

import javax.media.j3d.Appearance;
import javax.media.j3d.Group;
import javax.media.j3d.Material;
import javax.media.j3d.PolygonAttributes;
import javax.media.j3d.Texture;
import javax.media.j3d.TextureAttributes;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Vector3d;
import com.sun.j3d.utils.image.TextureLoader;

public class Temple extends Group {
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	
	public Temple() {
		
		/* ------------------------------ TEXTURE ----------------------------- */
		TextureLoader textureLoader = new TextureLoader("src/img/PietraColonna.jpg", null);
		Texture texture = textureLoader.getTexture();
		
		TextureAttributes textAtt = new TextureAttributes();
		textAtt.setTextureMode(TextureAttributes.MODULATE);
		
		appearance.setTexture(texture);
		appearance.setTextureAttributes(textAtt);
		appearance.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_FILL,PolygonAttributes.CULL_NONE,0));
		appearance.setMaterial(material);
		/* -------------------------------------------------------------------- */
		
		TransformGroup tgFacciata = new TransformGroup();
		TransformGroup tgRetro = new TransformGroup();
		TransformGroup tgLati = new TransformGroup();
		TransformGroup tgBase = new TransformGroup();
		TransformGroup tgInterno = new TransformGroup();
		
		tgFacciata.addChild(new Facade(appearance));
		tgRetro.addChild(new Facade(appearance));
		Transform3D retrot3d = new Transform3D();
		retrot3d.setTranslation(new Vector3d(0.0,0.0,-60));
		tgRetro.setTransform(retrot3d);
		
		tgLati.addChild(new Side(appearance));
		tgBase.addChild(new Ground(appearance));
		tgInterno.addChild(new Interior(appearance));
		
		addChild(tgFacciata);
		addChild(tgRetro);
		addChild(tgInterno);
		addChild(tgLati);
		addChild(tgBase);
	}
}
