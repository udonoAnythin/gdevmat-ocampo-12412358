Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker myWalker = new Walker();

void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  InitializeWalkers();
  
}


void draw()
{
  background(255);
  
  ocean.Render();
  
  UpdateWalkers();
}

void InitializeWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
   walkers[i] = new Walker(); 
   
   float mass = random(2, 10); 
   float posX = 2 * (Window.windowWidth / walkers.length)  * (i - (walkers.length / 2));
   PVector position = new PVector( posX, 200 );
   color newColor = color(random(255), random(255), random(255));
   
   walkers[i].SetWalker(position, newColor, mass);
   
  } 
}

void UpdateWalkers()
{
  for (Walker w : walkers)
  {
   
   //Wind
   PVector wind = new PVector(0.1, 0);
   w.ApplyForce(wind);
   
   //Grav
   PVector grav = new PVector(0, -0.15 * w.mass);
   w.ApplyForce(grav);
   
   if (ocean.IsCollidingWith(w))
   {
     PVector dragForce = ocean.CalcDragForce(w);
     w.ApplyForce(dragForce);
   }
  
   w.CheckEdges();
   w.Update();
   w.Render();
  }
}
