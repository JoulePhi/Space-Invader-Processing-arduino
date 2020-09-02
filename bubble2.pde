class Bubble{
float x;
float y;
float diameter;
float speed = random(2,6);


Bubble(float hor,float ver,PImage plyr){
  x = hor;
  y = ver;
  diameter = plyr.height;

}
void display(PImage plyr){
stroke(0);
image(plyr,x,y,diameter,diameter);
  }
  
void descend(){
y = y + speed;
  }
  
void bottom(){
if (y > height-diameter/2){
  y = random(-200,-100);
  diameter = diameter+0.1;
 speed = speed + 0.1;
 score++;
    }
  }
  
void printV(){
//println("nilai Y : " ,y,"diameter : " ,diameter);
  }
  
boolean nyentuh(Bubble musuh){
float dis = dist(x,y,musuh.x,musuh.y);
if ( dis <= diameter/2){
  y = random(-200,-100);
  return true;
}else{
 return false;
}

}
boolean nyentuh2(Bullet p){
float dis = dist(x,y,p.location.x,p.location.y);
if ( dis <= diameter/2-10){
  y = random(-200,-100);
  return true;
}else{
 return false;
}

}
}
