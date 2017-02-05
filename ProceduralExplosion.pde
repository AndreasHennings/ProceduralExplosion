float w2, h2; //coordinates of screen center: w2 = width/2, h2 = height/2
float sc =0.1; //scale: explosion speed
float r =1.0; //initial radius of explosion center

void setup()
{
  //fullScreen();
  size(200,200); //should be enough
  background(0);
  blendMode(ADD);
  w2=width/2;
  h2=height/2;
  noStroke();
}

void draw()
{ 
  {
    int numBalls = int(random(2)*int (r)+1);
    for (float angle=0; angle<360; angle+=(360/numBalls))
    {
      PVector p = new PVector (cos(angle)*r, sin(angle)*r);
      p.x*=noise(p.x*sc, p.y*sc);
      p.y*=noise(p.x*sc, p.y*sc);
            
      fill(255-random(20),255-r*random(1),255-r*r*random(1),180-r*random(2));     
      ellipse(w2+p.x,h2+p.y,random(r/2),random(r/2));  
    }    
  } 
  r+=r/10;
  if (r>100)
  {
    background(0);
    r=random(1);
  }
}