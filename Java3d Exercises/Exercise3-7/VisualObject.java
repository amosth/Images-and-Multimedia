package Esercizio37;

import javax.media.j3d.*;

abstract class VisualObject extends Shape3D {
	protected Geometry geometry;
	protected Appearance appearance;
	
	public VisualObject() {
		geometry = createGeometry();
		appearance = createAppearance();
		setGeometry(geometry);
		setAppearance(appearance);
	}
	
	/**
	 * Funzione che crea la geometria
	 */
	protected abstract Geometry createGeometry();
	
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
