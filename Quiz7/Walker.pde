public class Walker
{
  
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float terminalVelocity = 10;
  
  public float scale = 15;
  
  public Walker()
  {
    
  }
  
  PVector mousePos()
  {
   float x = mouseX - Window.windowWidth; 
   float y = -(mouseY - Window.windowHeight);
   
   return new PVector(x, y);
  }
  
  public void SetDirection()
  {
    PVector direction = PVector.sub(mousePos(), position);
    direction.normalize();
    acceleration = PVector.mult(direction, 0.2);
  }
  
  public void Update()
  {

    this.velocity.add(this.acceleration);
    
    velocity.limit(terminalVelocity);
    
    this.position.add(this.velocity);
    
  }
  
  public void Render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void CheckEdges()
  {
   if(this.position.x > Window.right)
   {
     this.position.x = Window.left;
   }
   else if (this.position.x < Window.left)
   {
     this.position.x = Window.right;
   }
   
   if(this.position.y > Window.top)
   {
     this.position.y = Window.bottom;
   }
   else if (this.position.y < Window.bottom)
   {
     this.position.y = Window.top;
   }
  }
  
}
