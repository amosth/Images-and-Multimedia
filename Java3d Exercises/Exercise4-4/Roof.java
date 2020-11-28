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
import com.sun.j3d.utils.geometry.*;
import com.sun.j3d.utils.image.TextureLoader;

import Esercizio42.Pediment;

public class Roof extends Group {
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	protected TransformGroup tgTrabeazione;
	protected TransformGroup tgSpiovente1;
	protected TransformGroup tgSpiovente2;
	protected TransformGroup tgFrontone;
	protected Box trabeazione;
	protected Box spiovente1;
	protected Box spiovente2;
	protected Pediment frontone;
	
	public Roof(Appearance app) {
		
		/* ------------------------------ TEXTURE ----------------------------- */
		TextureLoader textureLoader = new TextureLoader("src/img/PietraColonna.jpg", null);
		Texture texture = textureLoader.getTexture();
		
		TextureAttributes textureAttr = new TextureAttributes();
		textureAttr.setTextureMode(TextureAttributes.MODULATE);
		
		appearance.setTexture(texture);
		appearance.setTextureAttributes(textureAttr);
		appearance.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_FILL,PolygonAttributes.CULL_NONE,0));
		appearance.setMaterial(material);
		/* ------------------------------------------------------------------ */
		
		/* --------------------------- TRABEAZIONE -------------------------- */
		tgTrabeazione = new TransformGroup();
		trabeazione = new Box(14f,2f,1.5f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D trabeazioneTranslation = new Transform3D();
		trabeazioneTranslation.setTranslation(new Vector3d(0f, 13f, 0f));
		
		tgTrabeazione.setTransform(trabeazioneTranslation);
		tgTrabeazione.addChild(trabeazione);
		
		addChild(tgTrabeazione);
		/* ------------------------------------------------------------------ */
		
		/* ----------------------------- FRONTONE --------------------------- */
		tgFrontone = new TransformGroup();
		frontone = new Pediment(appearance);
		
		Transform3D frontoneTranslation = new Transform3D();
		frontoneTranslation.setTranslation(new Vector3d(0.0f, 14.8f, 0.0f));
		
		tgFrontone.setTransform(frontoneTranslation);
		tgFrontone.addChild(frontone);
		
		addChild(tgFrontone);
		/* ------------------------------------------------------------------ */
		
		/* --------------------------- SPIOVENTE1 --------------------------- */
		tgSpiovente1 = new TransformGroup();
		spiovente1 = new Box(7.9f,0.15f,1.5f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D spiovente1Translation = new Transform3D();
		Transform3D spiovente1Rotation = new Transform3D();
		
		spiovente1Translation.setTranslation(new Vector3d(-7.5f, 17f, 0f));
		spiovente1Rotation.rotZ(Math.toRadians(16.7));
		spiovente1Translation.mul(spiovente1Rotation);
		
		tgSpiovente1.setTransform(spiovente1Translation);
		tgSpiovente1.addChild(spiovente1);
		
		addChild(tgSpiovente1);
		/* ------------------------------------------------------------------ */
		
		/* --------------------------- SPIOVENTE2 --------------------------- */
		tgSpiovente2 = new TransformGroup();
		spiovente2 = new Box(7.9f,0.15f,1.5f, Primitive.GENERATE_NORMALS | Primitive.GENERATE_TEXTURE_COORDS, appearance);
		
		Transform3D spiovente2Translation = new Transform3D();
		Transform3D spiovente2Rotation = new Transform3D();
		
		spiovente2Translation.setTranslation(new Vector3d(7.5f, 17f, 0f));
		spiovente2Rotation.rotZ(Math.toRadians(-16.7));
		spiovente2Translation.mul(spiovente2Rotation);
		
		tgSpiovente2.setTransform(spiovente2Translation);
		tgSpiovente2.addChild(spiovente2);
		
		addChild(tgSpiovente2);
		/* ------------------------------------------------------------------ */
	}
}
