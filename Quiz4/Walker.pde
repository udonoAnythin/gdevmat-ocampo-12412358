public class Walker
{
 public float x;
 public float y;
 public float thickness;
 public float tx = 0, ty = 10000;
 public float tThickness = 10;
 
 
 public float r;
 public float g;
 public float b;
 public float tr = 150;
 public float tg = 300;
 public float tb = 450;
 
 void Render()
 {
   r = map( noise(tr), 0, 1, 0, 255 ); tr += 0.1;
   g = map( noise(tg), 0, 1, 0, 255 ); tg += 0.1;
   b = map( noise(tb), 0, 1, 0, 255 ); tb += 0.1;
   
   fill( r, g, b, 255 );
   noStroke();
   
   thickness = map( noise(tThickness), 0, 1, 5, 150 );
   circle(x, y, thickness);
   
   tThickness += 0.05;
 }
 
 void PerlinWalk()
 {
   x = map( noise(tx), 0, 1, -(width / 2.0), (width / 2.0) );
   y = map( noise(ty), 0, 1, -(height / 2.0), (height / 2.0) );
   
   tx += 0.01f;
   ty += 0.01f;
 }
 
}
