package Esercizio42;

import javax.media.j3d.*;
import javax.vecmath.*;
import com.sun.j3d.utils.geometry.*;

public class Frustum extends Shape3D {
	public static final float TOP = 0.5f;
	public static final float BOTTOM = -0.5f;
	protected Point3f v[] = null;
	protected TriangleStripArray triangleStrip = null;
	protected PolygonAttributes polyAttrbutes = new PolygonAttributes(PolygonAttributes.POLYGON_FILL, PolygonAttributes.CULL_NONE, 0);
	
	public Frustum(int steps, Appearance app) {
		v = new Point3f[(steps+1)*2];
		float rapp = 1.5f;
		
		for(int i=0; i<steps; i++) {
			double angle = 2*Math.PI*(double)i/(double)steps;
			float x = (float) Math.sin(angle);
			float y = (float) Math.cos(angle);
			v[i*2+0] = new Point3f(x, y, BOTTOM);
			v[i*2+1] = new Point3f(x*rapp, y*rapp, TOP);
		}
		
		v[steps*2+0] = new Point3f(0.0f, 1f, BOTTOM);
		v[steps*2+1] = new Point3f(0.0f, 1*rapp, TOP);
		int[] stripCounts= {(steps+1)*2};
		triangleStrip = new TriangleStripArray((steps+1)*2,	GeometryArray.COORDINATES | GeometryArray.NORMALS, stripCounts);
		triangleStrip.setCoordinates(0, v);
		
		GeometryInfo gi = new GeometryInfo(triangleStrip);
		NormalGenerator normalGenerator = new NormalGenerator();
		normalGenerator.generateNormals(gi);
		
		TexCoordGeneration textGeneration = new TexCoordGeneration();
		app.setTexCoordGeneration(textGeneration);
		
		setGeometry(gi.getGeometryArray());

		setAppearance(app);
	}
}
