Walker[] walkers = new Walker[8];

void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  InitializeWalkers();
}

void draw()
{
  background(80);
  
  //Draw the Line
  stroke(0);
  strokeWeight(10);
  line( 0, -320, 0, 320);
  
  UpdateWalkers();
  
  if (mousePressed)
  {
    InitializeWalkers();
  }
  
  
}

void InitializeWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
   walkers[i] = new Walker(); 
   
   //println("SPawned");
   
   float mass = walkers.length - i + 1; 
   float posY = 2 * (Window.windowHeight / walkers.length)  * (i - (walkers.length / 2));
   PVector position = new PVector( -500, posY);
   color newColor = color(random(255), random(255), random(255));
   
   walkers[i].SetWalker(position, newColor, mass);
   
  } 
}

void UpdateWalkers()
{
  for (Walker w : walkers)
  {
   
   
   float mew;
   if (w.position.x > 0) { mew = 0.4f; } else { mew = 0.01f; }
   float normal = 1;
   float frictionMag = mew * normal;
   PVector friction = w.velocity.copy();
   friction.mult(-1);
   friction.normalize();
   friction.mult(frictionMag);
   w.ApplyForce(friction);
   
   //Applied object masses abd adjusted the acceleration value to 0.02 from 0.2
   PVector accel = new PVector(0.02 * w.mass, 0 );
   w.ApplyForce(accel);
   println(mew);
   
   w.Update();
   w.Render();
  }
}
