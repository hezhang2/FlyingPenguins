SlingShot shooter= new SlingShot(50, 200);
Penguin bob= new Penguin(shooter.getX()+57, shooter.getY()+50);
PImage standFront;
PImage standBack;
PImage penny;
int ableRe=0;
public void setup() {
  frameRate(100);
  size(800, 450);
  standFront=loadImage("SlingshotFront.png");
  standBack=loadImage("SlingshotBack.png");
  penny=loadImage("Penguin.png");
}
public void draw() {
  background(#343D66);
  noStroke();
  rect(0,375,800,75);
  
  bob.move();
  bob.gravity();
  if(bob.getVeloX()<=0&&ableRe==1){
    ableRe=2;
    shooter.setWasDragged(false);
  }
  
  shooter.showSlingshotBack();
  if(bob.getIsFlying()==false&&bob.getX()<375&&mousePressed==true&&ableRe!=2&&shooter.getWasDragged()==true){
    shooter.showLineBack();
  }
  bob.show();
  if(bob.getIsFlying()==false&&bob.getX()<=375&&mousePressed==true&&ableRe!=2&&shooter.getWasDragged()==true){
    shooter.showLineFront();
  }
  shooter.showSlingshotFront();
  
//  stroke(255,0,0);
//  point(shooter.getX()+90, shooter.getY()+90);
//  point(bob.getX()+25,bob.getY()+25);
}
public void mousePressed(){
  if(ableRe==2){
    ableRe=0;
    bob.setVeloX(0);
    bob.setVeloY(0);
    bob.setX(shooter.getX()+57);
    bob.setY(shooter.getY()+50);
    bob.setGravity(false);
  }
}
public void mouseDragged() {
  if(ableRe==0){
    shooter.pull();
  }
}
public void mouseReleased() {
  if(shooter.getWasDragged()==true&&ableRe==0){
    ableRe=1;
    shooter.setReleased();
    if(bob.getX()!=107.0&&
       bob.getY()!=250.0){
       bob.setGravity(true);
       bob.setVeloCompo();
     }
  }
}

public class Penguin {
  private float myX, myY, mySize;
  private float myVeloX, myVeloY;
  private float myMass;
  private boolean isFlying;
  Penguin(float x, float y) {
    myX=x;
    myY=y;
    mySize=20;
    myVeloX=0;
    myVeloY=0;
    myMass=2.5;
    isFlying=false;
  }
  public void show(){
    image(penny,myX,myY);
  }
  public void setVeloCompo() {
    myVeloX=(shooter.getX()+90-bob.getX()+25)/20;
   myVeloY=-(bob.getY()+25-(shooter.getY()+90))/7;
  }
  public void move(){
    if(myY>375){
      setGravity(false);
      myY=375;
      if(myVeloX<0){
        myVeloX=0;
      }
      if(myVeloX>0){
        myVeloX-=.1;
      }
    }
    myX+=myVeloX;
    myY+=myVeloY;
  }
  public void gravity(){
    if(isFlying==true){
      myVeloY+=.25;
    }
  }
  public float getX(){return myX;}
  public float getY(){return myY;}
  public float getVeloX(){return myVeloX;}
  public float getVeloY(){return myVeloY;}
  public boolean getIsFlying(){return isFlying;}
  public void setX(float x){myX=x;}
  public void setY(float y){myY=y;}
  public void setVeloX(float x){myVeloX=x;}
  public void setVeloY(float y){myVeloY=y;}
  public void setGravity(boolean mode){isFlying=mode;}
}

public class SlingShot {
  private float myX, myY;
  private float strX, strY;
  private boolean wasDragged;
  SlingShot(float x, float y) {
    myX=x;
    myY=y;
    wasDragged=false;
    strX=myX+130;
    strY=myY+60;
  }
  public void showSlingshotFront(){
    image(standFront,myX,myY);
  }
  public void showLineFront(){
    stroke(50);
    strokeWeight(10);
    line(myX+130, myY+60, bob.getX()+12, bob.getY()+40);
  }
  public void showLineBack(){
    stroke(50);
    strokeWeight(10);
    line(myX+57, myY+70, bob.getX()+12, bob.getY()+40);
  }
  public void showSlingshotBack(){
    image(standBack,myX,myY);
  }
  public void pull() {
    if (mouseX>bob.getX()&&mouseX<bob.getX()+50&&
      mouseY>bob.getY()&&mouseY<bob.getY()+50)
      wasDragged=true;
    if (wasDragged==true&&ableRe==0) {
      if(mouseX<50){
        bob.setX(25);
      }else if(mouseX>shooter.getX()+90){
        bob.setX(shooter.getX()+90-25);
      }else{
        bob.setX(mouseX-25);
      }
      if(mouseY>400){
        bob.setY(375);
      }else if(mouseY<shooter.getY()){
        bob.setY(shooter.getY()-25);
      }else{
        bob.setY(mouseY-25);
      }
    }
  }
  public void setReleased() {
//    if (!(mouseX==107&&mouseY==250))
//      wasDragged=false;
    strX=myX+130;
    strY=myY+60;
  }
  public void setWasDragged(boolean bol){wasDragged=bol;}
  public boolean getWasDragged(){return wasDragged;}
  public float getX() {return myX;}
  public float getY() {return myY;}
  public float getStrX() {return strX;}
  public float getStrY(){return strY;}
}
