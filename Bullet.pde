class Bullet {
  //standard PVector used for the location of the bullet
  PVector location;
  int j = 20;
  //vars used to check the angle between location and the mouse
  float oldPosX, oldPosY, rotation, speed;
  Bullet() {
    //places the bullet in the middle of the room
    location= new PVector(hor+65, 350);
    //this checks the angle
    oldPosX = c.x+65;
    oldPosY = 0;
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    //bullet speed
    speed = 1;//change this number to change the speed
  } 
  void update() {
    //move the bullet
    location.x = location.x + cos(rotation/180*PI)*speed;
    location.y = location.y + sin(rotation/180*PI)*speed;
    ellipse(location.x, location.y, 10, 10);

    //removes the bullet from the arrayList if it is off the room
    if (location.x > 0 && location.x < width && location.y > 0 && location.x < height) {
    }
    else if(dist(location.x,location.y,b[0].x,b[0].y) < j  ){
      b[0].y = random(-200,-100);
      bullets.remove(l);
    }
    else if(dist(location.x,location.y,b[1].x,b[1].y) < j){
      b[1].y = random(-200,-100);
    }
    else if(dist(location.x,location.y,b[2].x,b[2].y) < j){
      b[2].y = random(-200,-100);
    }
    else{
    bullets.remove(l);
    }
  }  
}

class Player {
  PVector location;
  Player(float x, float y) {
    location = new PVector(x,y);
  } 
  void update() {
    if ( ver >= 1) {
      // this regulates the shooting speed
      if (canShoot == true) {
        bullets.add( new Bullet());
        canShoot = false;
        canShootCounter = 0;
      }
    }
    // this checks if the right amount of time has passed before canShoot can = true again
    if (canShoot == false) {
      canShootCounter ++;
      //if the right amount of time has passed. make canShoot true
      if (canShootCounter == 8)/*change this number to change the duration*/{
        canShoot = true;
      }
    }
  }
}
