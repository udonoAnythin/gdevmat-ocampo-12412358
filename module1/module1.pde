
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
  
  // Set BG
  background(0);
  
  DrawCartesianPlane();
  
  DrawLinearFunction();
  
  DrawQuadraticFunction();
  
  DrawCircle();
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
  
  color red = color(255, 0, 0);
  fill(red);
  noStroke();
  
  for(int x = -200; x <= 200; x++)
  {
    circle(x, x + 2, 5);
  }
  
}

void DrawQuadraticFunction()
{
  
  color blue = color(0, 255, 0);
  fill(blue);
  noStroke();
  
  for(float x = -300; x <= 300; x += 0.01f)
  {
    circle(x + 10, (float)Math.pow(x, 2) + (x * 2) - 5, 5);
  }
  
}

void DrawCircle()
{
  color green = color(0, 0, 255);
  fill(green);
  stroke(green);
  
  float radius = 50;
  
  for(int x = 0; x <= 360; x++)
  {
    circle(radius * (float)Math.cos(x), radius * (float)Math.sin(x), 3);
  }
  
}
