void game(){
  player.update();
  background(bg);
  
  
//if ( mulai == true){
  
  fill(#ffffff);
  textSize(20);
  textFont(Font1);
  text("Score : ",25,25);
  text(score,100,25);
  for ( int i=0; i < b.length;i++){
   for (l = bullets.size()-1; l >= 0; l--) {
    //you need a seperate var to get the object from the bullets arraylist then use that variable to call the functions
    Bullet bullet = bullets.get(l);
    bullet.update();
  }
  
  if (score < 0){
  state = GameOver;
  }
  c.x = hor;
  c.display(pl);

  b[i].display(mtr);
  b[i].descend();
  b[i].bottom();
  
  
  if(b[i].nyentuh(c)){
   //background(#ff1d0d);
   check = true;
     if(check == true){
       if ( score < 10){
       score -= 1;
       }
       else if ( score >= 10 && score <20){       
     score -= 2;
       }
       else if( score >= 20 && score < 30){
       score -= 5;
       }
       else if( score >= 30 && score < 40){
       score -= 7;
       }
       else if( score >= 40 && score < 50){
       score -= 10;
       }else if( score >= 50){
       score -= 15;
       }
     check = false;
     }
                     }
   
                                 }

  

}

void GameOver(){

String playA = "Play Again";
  image(GO,105,7);
    fill(#071c61);
    stroke(#1e9ee8);
    strokeWeight(5);
    rect(120,160,160,60,7);
    fill(255, 255, 255);
    stroke(0);
    textSize(30);
    text(playA, 125, 200);
    
  
  if (mouseX > 175 && mouseX < 230 && mouseY > 170 && mouseY < 200) {

      fill(32, 32, 32);
      textSize(30);
      text(playA, 125, 200);
    }
    if (mouseX > 175 && mouseX < 230 && mouseY > 170 && mouseY < 200 && mousePressed) {
      fill(32, 32, 32);
      textSize(30);
      text(playA, 125, 200);
      score = 0;
      hor= 0;
      b[0].y = random (-200,-100);
      b[1].y = random (-200,-100);
      b[2].y = random (-200,-100);
      b[3].y = random (-200,-100);
      b[4].y = random (-200,-100);
      b[5].y = random (-200,-100);
      state=GAME;
    }
}


void play(){
background(bg);
    stroke(226, 204, 0);
    y2++;
    if (y2 > height) {
      y2 = 0;
    }
    String play = "Play"; 
    logo.resize(300,300);
    image(logo,50,-70);
    fill(#071c61);
    stroke(#1e9ee8);
    strokeWeight(5);
    rect(165,170,75,40,7);
    fill(255, 255, 255);
    stroke(0);
    textSize(30);
    text(play, 175, 200);    
    //text("Settings", 445, 280);
    //noFill();
    //textSize(10);
    //text(mousePos, 350, 90);
    if (mouseX > 175 && mouseX < 230 && mouseY > 170 && mouseY < 200) {

      fill(32, 32, 32);
      textSize(30);
      text(play, 175, 200);
    }
    if (mouseX > 175 && mouseX < 230 && mouseY > 170 && mouseY < 200 && mousePressed) {
      fill(32, 32, 32);
      textSize(30);
      text(play, 175, 200);
      state=GAME;
    }
}


int RandomN(int min, int max) {

    if (min >= max) {
      throw new IllegalArgumentException("max must be greater than min");
    }

    Random r = new Random();
    return r.nextInt((max - min) + 1) + min;
  }
