Ball ball;

void setup_ball(){
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  
  ball = new Ball();
}

class Ball {
  float size, force_power;
  Vec2 acceleration;
  Body body;
  
  Ball(){
    acceleration = new Vec2(0, 0);
    size = width/20;
    force_power = 10;
    
    // Define a body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    // Set its position
    bd.position = box2d.coordPixelsToWorld(width/2, height/2);
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(size/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 3;
    fd.restitution = .1;
    
    body.createFixture(fd);
  }
  
  void update(){
    ball.acceleration.x = -ax * force_power;
    ball.acceleration.y = -ay * force_power;
    body.applyLinearImpulse(acceleration, box2d.getBodyPixelCoord(body), true);
  }
  
  void show(){
    fill(50, 50, 50);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    ellipse(pos.x, pos.y, size, size);
  }
}
