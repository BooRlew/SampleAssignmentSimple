//GOAL: make a 'traffic light' simulator. For now, just have the light 
// changing according to time. You may want to investigate the millis()
// function at processing.org/reference.

float timeTillRed;
float timeTillAmber;
float timeTillGreen;
float timeTillReset;
int state;
//int m = millis();

void setup() {
  size(600, 600);
  
  timeTillRed = 3000;
  timeTillAmber = 5000;
  timeTillGreen = 8000;
  timeTillReset = 11000;
  
  //m = 0;
  
  state = 0;
}

void draw() {
  background(255);
  drawOutlineOfLights();
  lightingUpLights();
}

void drawOutlineOfLights() {
  //box
  rectMode(CENTER);
  fill(200, 200, 0);
  rect(width/2, height/2, 75, 200, 10);
  
  //lights
  fill(255);
  ellipse(width/2, height/2 - 65, 50, 50); //top
  ellipse(width/2, height/2, 50, 50); //middle
  ellipse(width/2, height/2 + 65, 50, 50); //bottom
}

void lightingUpLights(){
  float m = millis();
  //Red Light 
  if (state == 0 && m < timeTillRed){
    fill(255, 0, 0);
    ellipse(width/2, height/2 - 65, 50, 50);
  //}
  //else{
    state = 1; 
  }
  //Amber Light
  if(state == 1 && m >= timeTillRed+1 && m < timeTillAmber){
    fill(255);
    ellipse(width/2, height/2 - 65, 50, 50);
    fill(255, 200, 0);
    ellipse(width/2, height/2, 50, 50);
  //}
  //else {
   state = 2; 
  }
  if (state == 2 && m >= timeTillAmber+1 && m < timeTillGreen && m < timeTillReset){
    fill(255); 
    ellipse(width/2, height/2, 50, 50);
    fill(0, 255, 0);
    ellipse(width/2, height/2 + 65, 50, 50);   
  }
  //if(state == 2 && m >= timeTillReset){
  //m = 0;
  //state = 0;
  //}
}
