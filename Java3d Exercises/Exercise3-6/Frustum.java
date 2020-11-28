package Esercizio36;

import javax.media.j3d.*;
import javax.vecmath.*;

public class Frustum extends Shape3D {
	protected Geometry geometry;
	protected Appearance appearance;
	
	public Frustum(Point3d[] pts) {
		Point3d[] faces = {
				pts[1-1], pts[2-1], pts[3-1], pts[4-1],
				pts[5-1], pts[6-1], pts[7-1], pts[8-1],
				pts[1-1], pts[2-1], pts[6-1], pts[5-1],
				pts[3-1], pts[4-1], pts[8-1], pts[7-1],
				pts[1-1], pts[4-1], pts[8-1], pts[5-1],
				pts[2-1], pts[3-1], pts[7-1], pts[6-1]
		};
		
		geometry = createGeometry(faces);
		appearance = createAppearance();
		setGeometry(geometry);
		setAppearance(appearance);
	}
	
	/**
	 * Funzione che crea la geometria
	 */
	protected Geometry createGeometry(Point3d[] faces) {
		QuadArray quads;
		quads = new QuadArray(faces.length, QuadArray.COORDINATES);
		quads.setCoordinates(0, faces);
	
		return quads;
	}
	
	/**
	 * Funzione che crea l'aspetto
	 */
	private Appearance createAppearance() {
		Appearance app = new Appearance();
		//POLYGON_LINE - il poligono viene renderizzato tracciando delle linee tra vertici consecutivi
		//CULL_BACK - renderizza tutti i poligoni
		app.setPolygonAttributes(new PolygonAttributes(PolygonAttributes.POLYGON_LINE, PolygonAttributes.CULL_NONE, 0));
		
		return app;
	}
}
