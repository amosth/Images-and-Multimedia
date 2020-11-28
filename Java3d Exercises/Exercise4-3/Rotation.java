package Esercizio43;

import java.awt.event.KeyEvent;
import java.util.Enumeration;
import javax.media.j3d.*;
import javax.vecmath.Vector3d;

public class Rotation extends Behavior {
	private TransformGroup targetTg;
	private Transform3D rotation = new Transform3D();
	private double degree = 0;
	
	public Rotation(TransformGroup targetTg) {
		this.targetTg = targetTg;
	}
	
	@Override
	public void initialize() {
		this.wakeupOn(new WakeupOnElapsedTime(15));
	}

	@Override
	public void processStimulus(Enumeration arg0) {
		
		//Decremento dell'angolo
		degree -= 0.01;
		if(degree == 2*Math.PI) {
			degree = 0;
		}
		
		//Impostazioni per la rotazione dell'angolo
		rotation.rotY(degree);
		Transform3D translation = new Transform3D();
		translation.setTranslation(new Vector3d(-5,0.0,0.0));
		
		rotation.mul(translation);
		targetTg.setTransform(rotation);
		
		this.wakeupOn(new WakeupOnAWTEvent(KeyEvent.KEY_PRESSED));
		this.wakeupOn(new WakeupOnElapsedTime(15));
	}
}
