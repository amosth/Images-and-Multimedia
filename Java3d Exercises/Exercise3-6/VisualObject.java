package Esercizio36;

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
	protected abstract Appearance createAppearance();
}
