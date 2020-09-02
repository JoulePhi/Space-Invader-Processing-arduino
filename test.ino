

const int button1 = 2;
const int button2 = 3;
const int button3 = 4;
const int button4 = 5;
const int led = 6;
const int pot = A0;

int horizon=0;
int verti =0;
int kecepatan = 3;
void setup() {
pinMode(button1,INPUT);
pinMode(button2,INPUT);
pinMode(button3,INPUT);
pinMode(button4,INPUT);
pinMode(pot,INPUT);
pinMode(led,OUTPUT);
Serial.begin(9600);
while(!Serial){;}
cekKontak();
}

void loop() {
  if(Serial.available() > 0){
    int arah = Serial.read();
  int hasilBaca1 = digitalRead(button1);
  int hasilBaca2 = digitalRead(button2);
  bool hasilBaca3 = digitalRead(button3);
  int hasilBaca4 = digitalRead(button4);

  
  if(hasilBaca1 == true){
     horizon =horizon - kecepatan;
     digitalWrite(led,HIGH);
    }
  else if(hasilBaca2==true){
    horizon=horizon + kecepatan;
    digitalWrite(led,HIGH);
    }
  else{

    digitalWrite(led,LOW);
  }
  int hasilPot = analogRead(pot)/4;
  Serial.write(horizon);
  Serial.write(hasilBaca3);
  Serial.write(hasilPot);
 

}
}

void cekKontak(){
  while(Serial.available() <= 0){
    Serial.print('A');
    delay(300);
    }
  }
