public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();

 public float terminalVelocity = 10;

 public float scale = 15;
 
 public float mass = 1;
 
 public color walkerColor = color(255);
 public PVector tempColor = new PVector(150, 300, 450);
 
 public Walker(){}
 
 public void SetWalker(PVector position, color newColor, float mass)
 {
   this.position = position;
   this.walkerColor = newColor;
   this.mass = mass;
   scale = mass * 15;
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
   fill(walkerColor, 255);
   noStroke();
   circle(position.x, position.y, scale);
 }
 
 public void ApplyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass);
   this.acceleration.add(f);
 }
 
}
