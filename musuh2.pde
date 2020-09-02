import processing.serial.*;
import java.util.*;
PImage bg,pl,mtr,logo,GO;
PFont Font1;
color bg1 = 0;
Serial myPort;
int[] array = new int[3];
ArrayList<Bullet> bullets;
int arah,hor,ukuran,y2;
int score,state,awal = 0;
int l;
int ver;
//int acak = (int) random(255);
final int MENU=0; 
final int GAME=1; 
final int GameOver = 2;
boolean down,kontak,check = false;
boolean mulai = true;
boolean canShoot = true;
float canShootCounter;
Player player = new Player(hor,350);
Bubble[] b = new Bubble[6];
Bubble c;


void setup(){
  randomSeed(1);
  bg = loadImage("spc.jpg");
  Font1 = createFont("Arial Bold", 18);
  pl = loadImage("spcshp2.png");
  mtr = loadImage("meteor.png");
  logo = loadImage("logo.png");
  GO = loadImage("GO.png");
  size(400,400);
  myPort = new Serial(this,"COM7",9600);
  for(int i=0; i < b.length; i++){
  b[i] = new Bubble(random(0,225),0,mtr);
   }
  c = new Bubble(width/2,350,pl);
  bullets = new ArrayList<Bullet>();
  }

void draw(){
 switch (state) {
  case MENU:
    play();
    break; 
  case GAME:
    game();
    break;
  case GameOver:
  GameOver();
    break;
  
  }  
  
}





















void serialEvent(Serial myPort){
  arah = myPort.read();
  if(kontak==false){
    if(arah=='A'){
    myPort.clear();
    kontak= true;
    myPort.write('A');
    }
  }
  
  else{
  array[awal]= arah;
  awal++;
  if (awal > 2){
    
  hor = array[0];
  ver = array[1];
  ukuran = array[2];
  //pot = array[2];
  myPort.write('A');
  awal = 0;
  
  
  }
  }
}
void mousePressed() {
  down = true;
}
