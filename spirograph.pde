// https://github.com/rspt/processing-spirograph.git

float a, b, h, xpos, ypos, oxpos, oypos, t, ot, d, od;
int centerX, centerY;

void setup() {
  size(800, 800);
  stroke(20);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  background(255);

  a = mouseX;
  b = 100;
  h = mouseY;

  for (int i=1; i<361; i+=1) {
    t = radians(i);
    ot = radians(i-1);
    d = a*t;
    od = a*ot;

    oxpos = (a-b)*cos(ot)+h*cos(od);
    oypos = (a-b)*sin(ot)+h*sin(od);    

    xpos = (a-b)*cos(t)+h*cos(d);
    ypos = (a-b)*sin(t)+h*sin(d);

    line(centerX+oxpos, centerY+oypos, centerX+xpos, centerY+ypos);
  }
}

void keyPressed(){
  save("export/a" + int(a) + "_b" + int(b) + "_h" + int(h) + ".tiff");
}