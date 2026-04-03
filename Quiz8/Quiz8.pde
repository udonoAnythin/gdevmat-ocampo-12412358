Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  InitializeWalkers();
}

void draw()
{
  
  background(30);
  
  UpdateWalkers();
}

void InitializeWalkers()
{
  for (int i = walkers.length - 1; i >= 0; i--)
  {
   walkers[i] = new Walker(); 
   
   float mass = i + 1;
   PVector position = new PVector( -500, 200);
   color newColor = color(random(255), random(255), random(255));
   
   walkers[i].SetWalker(position, newColor, mass);
  } 
}

void UpdateWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
   walkers[i].ApplyForce(wind);
   walkers[i].ApplyForce(gravity);
   walkers[i].CheckEdges();
   walkers[i].Update();
   walkers[i].Render();
  }
}
