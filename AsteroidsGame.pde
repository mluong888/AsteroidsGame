SpaceShip marvin;
Asteroids [] obstacles;
Star [] back;
int factor = 2;
int astFactor = 5;//your variable declarations here

public void setup() 
{
  size(500,500);
  
  marvin = new SpaceShip();
  back = new Star[(int)(Math.random()*150)+30];
for(int i=0; i<back.length; i++)
{
  back[i] = new Star();
}
obstacles = new Asteroids[5];
for (int j=0; j<obstacles.length; j++)
{
  obstacles[j] = new Asteroids();
}
  //your code here
}

public void draw() 
{
  background(0,0,0);
  for(int i=0; i<back.length; i++)
{
  back[i].show();
}
  for(int j=0; j<obstacles.length; j++)
  {
    obstacles[j].show();
    obstacles[j].move();
  }
  marvin.show();
  marvin.move();
  marvin.keyPressed();

  
  //your code here
}
class SpaceShip extends Floater  
{   
  
SpaceShip()
{
  corners = 26;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0]=11*factor;
  yCorners[0]=-1*factor;
  xCorners[1]=11*factor;
  yCorners[1]=1*factor;
  xCorners[2]=6*factor;
  yCorners[2]=1*factor;
  xCorners[3]=6*factor;
  yCorners[3]=3*factor;
  xCorners[4]=2*factor;
  yCorners[4]=3*factor;
  xCorners[5]=-8*factor;
  yCorners[5]=12*factor;

  xCorners[6]=-13*factor;
  yCorners[6]=12*factor;
  xCorners[7]=-7*factor;
  yCorners[7]=6*factor;
  xCorners[8]=-7*factor;
  yCorners[8]=5*factor;
  xCorners[9]=-10*factor;
  yCorners[9]=5*factor;
  xCorners[10]=-10*factor;
  yCorners[10]=3*factor;

  xCorners[11]=-7*factor;
  yCorners[11]=3*factor;
  xCorners[12]=-7*factor;
  yCorners[12]=2*factor;
  xCorners[13]=-15*factor;
  yCorners[13]=2*factor;
  xCorners[14]=-15*factor;
  yCorners[14]=-2*factor;
  xCorners[15]=-7*factor;
  yCorners[15]=-2*factor;

  xCorners[16]=-7*factor;
  yCorners[16]=-3*factor;
  xCorners[17]=-10*factor;
  yCorners[17]=-3*factor;
  xCorners[18]=-10*factor;
  yCorners[18]=-5*factor;
  xCorners[19]=-7*factor;
  yCorners[19]=-5*factor;

  xCorners[20]=-7*factor;
  yCorners[20]=-6*factor;
  xCorners[21]=-13*factor;
  yCorners[21]=-12*factor;
  xCorners[22]=-8*factor;
  yCorners[22]=-12*factor;
  xCorners[23]=2*factor;
  yCorners[23]=-3*factor;
  xCorners[24]=6*factor;
  yCorners[24]=-3*factor;
  xCorners[25]=6*factor;
  yCorners[25]=-1*factor;
 
 myColor = color(255,0,0);
 myCenterX =250;
 myCenterY=250;
 myDirectionX=0;
 myDirectionY=0;
 myPointDirection=0;
}
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionY;}   
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
    //your code here
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
  public void keyPressed()
  {
  if(keyPressed == true && key == 'w')
  {
    marvin.rotate(-3);
  }
  if(keyPressed == true && key == 's')
  {
    marvin.rotate(3);
  }
  if(keyPressed == true && key == 'c')
  {
    marvin.accelerate(0.01);
  }
  if(keyPressed == true && key == 'h')
  {
    myDirectionY = 0;
    myDirectionX =0;
    marvin.myPointDirection = Math.random()*360;
    marvin.myCenterX = Math.random()*500;
    marvin.myCenterY = Math.random()*500;
  }
}
}
public class Star
{
    private int myX, myY;
    Star()
    {
      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
    }
    public void show()
    {
      noStroke();
      fill(255);
      ellipse(myX,myY,5,5);
    }
}
public class Asteroids extends Floater
{
  private int rotSpeed;
  Asteroids()
  {
  corners = 10;
  xCorners = new int [corners];
  yCorners = new int[corners];
  xCorners[0] =2*astFactor;
  yCorners[0] =-1*astFactor;
  xCorners[1] =3*astFactor;
  yCorners[1] =1*astFactor;
  xCorners[2] =1*astFactor;
  yCorners[2] =3*astFactor;
  xCorners[3] =-1*astFactor;
  yCorners[3] =2*astFactor;
  xCorners[4] =-3*astFactor;
  yCorners[4] =1*astFactor;
  xCorners[5] =-3*astFactor;
  yCorners[5] =0*astFactor;
  xCorners[6] =-2*astFactor;
  yCorners[6] =-2*astFactor;
  xCorners[7] =0*astFactor;
  yCorners[7] =-4*astFactor;
  xCorners[8] =2*astFactor;
  yCorners[8] =-3*astFactor;
  xCorners[9] =3*astFactor;
  yCorners[9] =-2*astFactor;

  rotSpeed = (int)(Math.random()*5)-2;
  myColor = color(110,110,110);
  myCenterX =(int)(Math.random()*500);
  myCenterY=(int)(Math.random()*500);
  
  }
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return myDirectionY;}   
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 

public void move()
{
  rotate(rotSpeed);
  super.move();
}
}


