class Walker
{
 float x;
 float y;
 
 void Render()
 {
   
   fill( int(random(255)), int(random(255)), int(random(255)), int(random(50, 100)) );
   noStroke();
   circle(x, y, 30);
   
 }
 
 void RandomWalk()
 {
  
   int randomWalk = int(random(8));
   
   switch(randomWalk)
   {
     
     case 0: y+=10; break;
     case 1: y+=7; x+=7; break;
     case 2: x+=10; break;
     case 3: x+=7; y-=7; break;
     case 4: y-=10; break;
     case 5: y-=7; x-=7; break;
     case 6: x-=10; break;
     case 7: x-=7; y+=7; break;
     
   }
   
 }
 
 void RandomWalkBiased()
 {
   //40% of walking up, the rest being 20%
   int randomWalk = int(random(5));
   
   switch(randomWalk)
   {
     
     case 0:
     case 1: y+=10; break;
     case 2: x+=10; break;
     case 3: x-=10; break;
     case 4: y-=10; break;
     
   }
   
 }
 
}
