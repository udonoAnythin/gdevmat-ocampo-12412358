public class Walker
{
 public PVector position = new PVector();
 public PVector direction = new PVector();
 public float speed = 8;
 public float thickness = 50;
 
 
 public color walkerColor = color(255);
 public PVector tempColor = new PVector(150, 300, 450);
 
 public Walker(){}
 
 public void SetWalker(PVector position, float thickness, color newColor)
 {
   this.position = position;
   this.thickness = thickness;
   this.walkerColor = newColor;
 }
 
 void Render()
 {
   fill( walkerColor, 255 );
   noStroke();
   
   circle(position.x, position.y, thickness);
 }
 
 void SetDirection(PVector target)
 {
   direction = PVector.sub(target, position);
   direction.normalize();
 }
 
 void Move()
 {
   position.add( PVector.mult(direction, speed) );
 }
 
 
}
