public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();

 public float terminalVelocity = 10;

 public float scale = 15;
 
 public float mass = 1;
 
 public color walkerColor = color(255, 255, 255);
 public PVector tempColor = new PVector(150, 300, 450);
 
 public float gravitationalConstant = 1;
 
 public Walker(){}
 
 public void SetWalker(PVector position, color newColor, float mass)
 {
   this.position = position;
   this.walkerColor = newColor;
   this.mass = mass;
   scale = mass * 10;
 }
 
 public void Update()
 {

   this.velocity.add(this.acceleration);
    
   velocity.limit(terminalVelocity);
    
   this.position.add(this.velocity);
   
   this.acceleration.mult(0);
 }
  
 public void Render()
 {
   fill(walkerColor);
   noStroke();
   circle(position.x, position.y, scale);
 }
 
 public void ApplyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass);
   this.acceleration.add(f);
 }
 
 public void CheckEdges()
 {
  if(this.position.x > Window.right || this.position.x < Window.left)
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.right;
    } else
    {
      this.position.x = Window.left;
    }
    
    this.velocity.x *= -1;
  }
   
  if(this.position.y > Window.top || this.position.y < Window.bottom)
  {
    if(this.position.y > Window.top)
    {
      this.position.y = Window.top;
    } else
    {
      this.position.y = Window.bottom;
    }
    
    this.velocity.y *= -1;
  }

 }
 
 public PVector CalculateAttraction(Walker walker)
 {
   PVector force = PVector.sub(this.position, walker.position);
   
   float distance = force.mag();
   distance = constrain(distance, 5, 25);
   
   force.normalize();
   
   float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
   force.mult(strength);
   
   return force;
   
 }
 
}
