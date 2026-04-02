int timer = 0;

Walker whiteHole = new Walker();
Walker[] matter = new Walker[100];

void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //Instantiate all matter first
  for (int i = 0; i < matter.length; i++)
  {
   matter[i] = new Walker(); 
  }
  
}

void draw()
{
  
  background(30);
  
  if (timer % 240 == 0)
  {
    //Re-instantiate everything
    SpawnMatter();
    
  }
  
  MoveAndRenderMatter();
  
  RenderWhiteHole();
  
  //Increment timer
  timer++;
}

PVector mousePos()
{
  //WindowWidth/height is already halved according to the values set in the Window Class
 float x = mouseX - Window.windowWidth; 
 float y = -(mouseY - Window.windowHeight);
 
 return new PVector(x, y);
}

void RenderWhiteHole()
{
  
  whiteHole.position = mousePos(); 
  whiteHole.walkerColor = color(255, 255, 255);
  whiteHole.thickness = 50;
 
  whiteHole.Render();
}

void SpawnMatter()
{
 
  for(int i = 0; i < matter.length; i++)
  {
    //Initailize Variables
    PVector pos = new PVector( randomGaussian() * Window.windowWidth, randomGaussian() * Window.windowHeight );
    if (pos.x < Window.left) { pos.x = Window.left; }
    if (pos.x > Window.right) { pos.x = Window.right; }
    if (pos.y < Window.bottom) { pos.y = Window.bottom; }
    if (pos.y > Window.top) { pos.y = Window.top; }
    
    float thickness = random(10, 40);
    color newColor = color( random(255), random(255), random(255) );
    
    //Set values
    matter[i].SetWalker(pos, thickness, newColor);
    
  }
  
}

void MoveAndRenderMatter()
{
  for(int i = 0; i < matter.length; i++)
  {
    matter[i].SetDirection(whiteHole.position);
    
    matter[i].Move();
    
    matter[i].Render();
  }
}
