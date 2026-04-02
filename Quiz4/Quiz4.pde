
float t = 0;

void setup()
{
  // P3D makes environment 3D
  size(1280, 720, P3D);
  
  //Set Camera Position
  camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker perlinWalker = new Walker();

void draw()
{
  
  perlinWalker.PerlinWalk();
  perlinWalker.Render();
  
}
