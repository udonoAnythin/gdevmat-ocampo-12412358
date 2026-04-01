
//Colors
color purple = color(255, 0, 255);
color yellow = color(255, 255, 0);
color orange = color(255, 172, 0);

float amp = 50;
float freq = 0.1;
float time = 0;

//Called at the first frame
void setup()
{
  // P3D makes environment 3D
  size(1280, 720, P3D);
  
  //Set Camera Position
  camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

//Update function
void draw()
{
  //Set time
  time = millis() / 50;
  
  // Set BG
  background(0);
  
  DrawCartesianPlane();
  
  DrawLinearFunction();
  
  DrawQuadraticFunction();
  
  DrawSineWave();
}

void DrawCartesianPlane()
{
  //Settings
  strokeWeight(3);
  color white = color(255);
  fill(white);
  stroke(white);
  
  //Axes
  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);
  
  //Lines
  for(int i = -300; i <= 300; i += 10)
  {
    line(-5, i, 5, i);
    line (i, -5, i, 5);
  }
}

void DrawLinearFunction()
{
  
  
  fill(purple);
  noStroke();
  
  for(int x = -200; x <= 200; x++)
  {
    int y = (-5 * x) + 30;
    circle(x, y, 5);
  }
  
}

void DrawQuadraticFunction()
{
  
  
  fill(yellow);
  noStroke();
  
  for(float x = -300; x <= 300; x += 0.01f)
  {
    float y = (float)Math.pow(x, 2) + (-15 * x) - 3;
    circle(x, y, 5);
  }
  
}

void DrawSineWave()
{
  
  fill(orange);
  stroke(orange);
  
  for(float x = -300; x <= 300; x += 0.01f)
  {
    float y = amp * (float)Math.sin(freq * (x - time));
    circle(x, y, 3);
  }
  
}

void keyPressed()
{
 
  if (keyCode == UP)
  {
    amp += 20;
  }
  
  if (keyCode == DOWN)
  {
    amp -= 20;
  }
  
  if (keyCode == LEFT)
  {
    freq *= 1.2;
  }
  
  if (keyCode == RIGHT)
  {
    freq /= 1.2;
  }
  
}
