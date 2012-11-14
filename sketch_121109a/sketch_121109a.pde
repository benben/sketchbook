int ITERATIONS = 13;

ArrayList levels; 

void setup() {
  size(1024,576);
  //size(2048, 1152);
  frameRate(1);
  smooth();
  noFill();
  stroke(255);
  
  levels = new ArrayList();
  double circle_size = height/100.0*95.0;
  
  for(int i = 0; i < ITERATIONS; i++) {
    ArrayList circles = new ArrayList();
    if(i > 0) {
      ArrayList previous_circles = (ArrayList)levels.get(i-1);
      
      for(int j = 0; j < previous_circles.size(); j++) {
        PVector prev = (PVector)previous_circles.get(j);
        circles.add(new PVector(prev.x - prev.z/2,prev.y,prev.z / 3));
        circles.add(new PVector(prev.x + prev.z/2,prev.y,prev.z / 3));
      }
    } else {
      circles.add(new PVector(0.0,0.0,(float)circle_size));
    }
    levels.add(circles);
  }
}

boolean drawed = false;
void draw() {
  if (!drawed) {
    background(0);
    translate(width/2, height/2);
  
    for(int i = 0; i < ITERATIONS; i++) {
      ArrayList circles = (ArrayList)levels.get(i);
      for(int j = 0; j < circles.size(); j++) {
        PVector c = (PVector) circles.get(j);
        ellipse(c.x,c.y,c.z,c.z);
      }
    }
    drawed = true;
  }
}

boolean saved = false;
void keyPressed() {
  if(!saved) {
    if (key == ' ') {
      saveFrame(String.format("%04d%02d%02d_%02d%02d%02d", year(), month(), day(), hour(), minute(), second())+".png");
      saved = true;
    } 
  }
}
