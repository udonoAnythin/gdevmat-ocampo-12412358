Walker[] walkers = new Walker[10];

void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  InitializeWalkers();
  
}


void draw()
{
  background(255);
  
  CalculateAllAttractions();
  
  UpdateAndRenderWalkers();
}

void InitializeWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
   walkers[i] = new Walker(); 
   
   float mass = random(2, 10); 
   float posX = random(Window.left, Window.right);
   float posY = random(Window.bottom, Window.top);
   PVector position = new PVector( posX, posY );
   color newColor = color(random(255), random(255), random(255));
   
   walkers[i].SetWalker(position, newColor, mass);
  } 
}

void CalculateAllAttractions()
{
  for (Walker w1 : walkers)
  {
    
    for (Walker w2 : walkers)
    {
      
      if (w1 != w2)
      {
        w1.ApplyForce( w2.CalculateAttraction(w1) );
      }
      
    }
    
  }
    
}

void UpdateAndRenderWalkers()
{
  for (Walker w : walkers)
  {
    w.Update();
    w.Render();
  }
}
