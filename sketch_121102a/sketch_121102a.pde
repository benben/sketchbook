int ITERATIONS = 3;

ArrayList levels; 

void setup() {
  size(1024,576);
  //size(4096,2304);
  //size(2048, 1152);
  frameRate(1);
  smooth();
  noFill();
  stroke(255);
  
  levels = new ArrayList();
  double circle_size = height/100.0*95.0;
  
  println("----->" + circle_size);
  
  double previous_circle_size = 0;
  
  for(int i = 0; i < ITERATIONS; i++) {
    ArrayList circles = new ArrayList();
    double current_circle_count = pow(2,i);
    double current_circle_size  = circle_size/(i+1);
    String str = "";
    for(int j = 0; j < current_circle_count; j++) {
      double pos_x = 0;
      double pos_y = 0;
      if (i > 0) {
        //println("=====" + j + "===="+i+"=====");
        //println(current_circle_size);
        //println(current_circle_count);
        // width/8 * ((i%7)+1), height/8 * ((floor(i/7.0))+1)
        double chunk_size = 450.0 / (current_circle_count+1);
        
        //println(chunk_size);
        //pos_x = chunk_size + (chunk_size * j) - 225; // + current_circle_size/2;
        pos_x = (current_circle_size * j) - current_circle_size*current_circle_count/2 + current_circle_size/2;
        //if(j >= current_circle_count/2) {pos_x = pos_x*-1;}
        //str += pos_x + " | ";
        //println(pos_x);
        //pos_y = current_circle_size/current_circle_count * ((floor(j/(current_circle_count-1)))+1);
      }
      //println(str);
      if (pos_x < width/2+200 && pos_x > -width/2-200) {
        circles.add(new PVector((float)pos_x,(float)pos_y,(float)current_circle_size));
      }
    }
    previous_circle_size = current_circle_size;
    levels.add(circles);
  }
}

boolean drawed = false;
void draw() {
  if (!drawed) {
  background(0);
  translate(width/2, height/2);
  
  for(int i = 0; i < ITERATIONS; i++) {
    ArrayList circles = (ArrayList) levels.get(i);
    //pushMatrix();
    for(int j = 0; j < circles.size(); j++) {
      PVector c = (PVector) circles.get(j);
      
      //pushMatrix();
      //int m = j % 2;
      //if (m == 0) { m = -1;}
      //if (circles.size() >= 3) {r = i+1;}
      //translate(c.z*i*m,0);
      ellipse(c.x,c.y,c.z,c.z);
      //popMatrix();
    }
    //popMatrix();
  }
  drawed = true;
  }
}

boolean saved = false;
void keyPressed() {
  if(!saved) {
    saveFrame(String.format("%04d%02d%02d_%02d%02d%02d", year(), month(), day(), hour(), minute(), second())+".png");
    saved = true;
  }
}
