package Esercizio42;

import javax.media.j3d.*;
import javax.vecmath.*;
import com.sun.j3d.utils.geometry.*;

public class Pediment extends Shape3D {
	public static final float TOP = 0.5f;
	public static final float BOTTOM = -0.5f;
	protected TriangleStripArray triangleStrip = null;
	protected PolygonAttributes polyAttrbutes = new PolygonAttributes(PolygonAttributes.POLYGON_LINE,PolygonAttributes.CULL_NONE, 0);
	protected Appearance appearance = new Appearance();
	protected Material material = new Material();
	
	public Pediment(Appearance app) {
		Point3f v[] = {
			new Point3f(-14.0f,0.0f,1.5f), new Point3f(-14.0f,0.0f,-1.5f), new Point3f(14.0f,0.0f,-1.5f), new Point3f(14.0f,0.0f,1.5f),
			new Point3f(0.0f,4.2f,1.5f), new Point3f(0.0f,4.2f,-1.5f)
		};
		
		Point3f faces[] = {
			v[2], v[3], v[0],
			v[0], v[1], v[2],
			v[0], v[4], v[3],
			v[1], v[5], v[2],
			v[0], v[4], v[5],
			v[0], v[1], v[5],
			v[3], v[4], v[5],
			v[2], v[5], v[3]
		};
		
		int[] stripCounts = {3,3,3,3,3,3,3,3};
		
		triangleStrip = new TriangleStripArray(faces.length,
				GeometryArray.COORDINATES | GeometryArray.NORMALS | GeometryArray.TEXTURE_COORDINATE_2, stripCounts);
		triangleStrip.setCoordinates(0,faces);
		
		GeometryInfo gi = new GeometryInfo(triangleStrip);
		
		NormalGenerator normalGenerator = new NormalGenerator();
		normalGenerator.generateNormals(gi);
		
		TexCoordGeneration textGeneration = new TexCoordGeneration();
		app.setTexCoordGeneration(textGeneration);
		
		setGeometry(gi.getGeometryArray());

		appearance.setPolygonAttributes(polyAttrbutes);
		setAppearance(app);
	}
}
