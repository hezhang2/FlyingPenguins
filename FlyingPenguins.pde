SlingShot shooter= new SlingShot(50,400);
Penguin bob= new Penguin(shooter.getX(),shooter.getY());
public void setup(){
	size(800,450);
}
public void draw(){
	background(#343D66);
	bob.show();
	shooter.show();
}

public class Penguin{
	private float myX,myY,mySize;
	private float myVeloX,myVeloY;
	private float myAngle;
	//private float myWeight;
	Penguin(float x, float y){
		myX=x;
		myY=y;
		mySize=20;
	}
	public void show(){
		noStroke();
		fill(250);
		ellipse(myX,myY,mySize,mySize);
	}
	public void setAngle(float angle){myAngle=angle;}//angle should be in radians
	public void setVelo(float initVelo){
		myVeloX=initVelo*cos(myAngle);
		myVeloY=initVelo*sin(myAngle);
	}
	public void setX(float x){myX=x;}
	public void setY(float y){myY=y;}
	public void accelerateY(float acc){
		myVeloY+=acc;
	}
}

public class SlingShot{
	private float myX,myY;
	private float strX,strY;
	SlingShot(float x, float y){
		myX=x;
		myY=y;
	}
	public void show(){
		stroke(50);
		line(myX,myY,strX,strY);
		noStroke();
		fill(50);
		rect(myX-2.5,myY,5,50);
	}
	public void pull(){
		strX=mouseX;
		strY=mouseY;
	}
	public void mousePressed(){
		pull();
	}
	public float getX(){return myX;}
	public float getY(){return myY;}
}