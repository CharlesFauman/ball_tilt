class Coin{
  Body body;
  float size;
  
  Coin(){
    size = 10;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    
    bd.position.set(box2d.coordPixelsToWorld(random(0 + size/2,width - size/2), random(0 + size/2,height - size/2)));
    
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(size/2);
    
    body.createFixture(cs, 1);
  }
  
  void reposition(){
    body.setTransform(box2d.coordPixelsToWorld(random(0 + size/2,width - size/2), random(0 + size/2,height - size/2)), 0);
  }
  
  void show(){
    fill(255, 251, 40);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, size, size);
  }
}
