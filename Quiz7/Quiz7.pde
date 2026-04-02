
Walker[] walkers = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //myWalker.acceleration = new PVector(-0.01,0.1);
  //myWalker.scale = 50;
  
  InitializeWalkers();
}

void draw()
{
  background(80);
  
  UpdateWalkers();
  
}

void InitializeWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
   walkers[i] = new Walker(); 
   walkers[i].position = new PVector( random(Window.left, Window.right), random(Window.bottom, Window.top) );
   walkers[i].scale = random(10, 30);
  } 
}

void UpdateWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].SetDirection();
    walkers[i].Update();
    //walkers[i].CheckEdges();
    
    walkers[i].Render();
  }
  
  
}
