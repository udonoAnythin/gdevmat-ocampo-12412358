void setup()
{
  
  size(1280, 720, P3D);
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
}

PVector mousePos()
{
  //WindowWidth/height is already halved according to the values set in the Window Class
 float x = mouseX - Window.windowWidth; 
 float y = -(mouseY - Window.windowHeight);
 
 return new PVector(x, y);
}

void draw()
{
  
  background(30);
  
  DrawLightsaber();
  
}

void DrawLightsaber()
{
  strokeWeight(17);
  stroke(255, 0, 0);
  
  PVector mouse = mousePos();
  
  //Glows
  mouse.normalize();
  mouse.mult(450);
  
  PVector saberOrigin = mousePos().normalize();
  saberOrigin.mult(100);
  
  line(saberOrigin.x, saberOrigin.y, mouse.x, mouse.y);
  line(-mouse.x, -mouse.y, -saberOrigin.x, -saberOrigin.y);
  
  //Sabers
  strokeWeight(7);
  stroke(255);
  line(saberOrigin.x, saberOrigin.y, mouse.x, mouse.y);
  line(-mouse.x, -mouse.y, -saberOrigin.x, -saberOrigin.y);
  
  //Printing the magnitude of one blade
  println(mouse.mag());
  
  //Black Handle
  strokeWeight(12);
  stroke(10);
  line(0, 0, saberOrigin.x, saberOrigin.y);
  line(-saberOrigin.x, -saberOrigin.y, 0, 0);
  
}
