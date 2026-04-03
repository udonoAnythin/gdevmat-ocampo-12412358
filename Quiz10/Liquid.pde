public class Liquid
{
  
  public float x, y;
  public float horizon, depth;
  public float cd;
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void Render()
  {
    fill(28, 120, 186);
    
    noStroke();
    beginShape();
    
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    
    endShape();
  }
  
  public boolean IsCollidingWith(Walker walker)
  {
    PVector pos = walker.position.copy();
    
    return pos.x > this.x - this.horizon &&
          pos.x < this.x + this.horizon &&
          pos.y < this.y;
  }
  
  public PVector CalcDragForce(Walker walker)
  {
    float speed = walker.velocity.mag();
    float dragMag = this.cd * speed * speed;
    
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    dragForce.normalize().mult(dragMag);
    return dragForce;
  }
}
