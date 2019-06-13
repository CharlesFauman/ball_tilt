import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

void setup_box_world() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0, 0);
  
  float thickness = 10;
  new Boundary(width/2, 0-thickness/2, width, thickness);
  new Boundary(width/2, height + thickness/2, width, thickness);
  new Boundary(-thickness/2, height/2, thickness, height);
  new Boundary(width + thickness/2, height/2, thickness, height);
  
  box2d.listenForCollisions();
}

void update_box_world() {
  box2d.step();
}

// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  vibrer.vibrate(100);
}

// Objects stop touching each other
void endContact(Contact cp) {
}
