int frames = 0;

void setup()
{
  // P3D makes environment 3D
  size(1280, 720, P3D);
  
  //Set Camera Position
  camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  background(50);
}

void draw()
{
  frames++;
  
  if (frames % 300 == 0) { background(50); }
  
  float gaussian = randomGaussian();
  
  float stdev = 100;
  float posMean = 0;
  
  float x = stdev * gaussian + posMean;
  float y = random( -(height/2.0), (height/2.0) );
  
  float sdThickness = 50;
  float meanThickness = 10;
  float randThickness = randomGaussian();
  float thickness = sdThickness * randThickness + meanThickness;
  
  noStroke();
  
  fill(random(255), random(255), random(255), random(10, 100));
  
  circle(x, y, thickness);
  
}
