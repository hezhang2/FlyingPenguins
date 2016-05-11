import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FlyingPenguins extends PApplet {

SlingShot shooter= new SlingShot(50,400);
Penguin bob= new Penguin(shooter.getX(),shooter.getY());
public void setup(){
	size(800,450);
}
public void draw(){
	background(0xff343D66);
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
		rect(myX-2.5f,myY,5,50);
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FlyingPenguins" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
