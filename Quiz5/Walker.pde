public class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector(5, 8);
 public float thickness = 50;
 
 
 public PVector walkerColor = new PVector();
 public PVector tempColor = new PVector(150, 300, 450);
 
 void Render()
 {
   walkerColor.x = map( noise(tempColor.x), 0, 1, 0, 255 ); 
   walkerColor.y = map( noise(tempColor.y), 0, 1, 0, 255 ); 
   walkerColor.z = map( noise(tempColor.z), 0, 1, 0, 255 ); 
   tempColor.add(new PVector(0.1, 0.1, 0.1));
   
   fill( walkerColor.x, walkerColor.y, walkerColor.z, 255 );
   noStroke();
   
   circle(position.x, position.y, thickness);

 }
 
 void MoveAndBounce()
 {
   position.add(velocity);
  
  if (position.x > Window.right || position.x < Window.left)
  {
    velocity.x *= -1;
  }
  
  if (position.y > Window.top || position.y < Window.bottom)
  {
    velocity.y *= -1;
  }
 }
 
 
}
