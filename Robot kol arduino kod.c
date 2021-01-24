#include <Servo.h>

Servo mg995;
Servo mg995_1;
Servo mg90s;
Servo mg90s_1;
Servo sg90;

int pos90s=140;
int pos995=90;
int pos90s_1=30;
int pos995_1=50;
int possg90=90;

const int in1=8; 
const int in2=9; 
int sensorpin=7;
int deger=0;

void setup() {

  mg995.attach(2);
  mg995_1.attach(3);
  mg90s.attach(4);
  mg90s_1.attach(5);
  sg90.attach(6);
 

  pinMode(sensorpin,INPUT);
  pinMode(in1,OUTPUT);
  pinMode(in2,OUTPUT);
}

void loop() {
  
  deger=digitalRead(sensorpin);
  
  if(deger==HIGH){
    
    digitalWrite(in1,HIGH); 
    digitalWrite(in2,LOW);

    
      mg995.write(90);
  mg995_1.write(50);
  mg90s.write(140);
  mg90s_1.write(30);
  sg90.write(90);


  }
   
    else {

      
    digitalWrite(in1,LOW);
    digitalWrite(in2,LOW);

    
    delay(100);
  for(pos90s=140;pos90s>=70;pos90s -=1){
    mg90s.write(pos90s);
    delay(20);
  }
  delay(100);
  for(pos995=90;pos995>=20;pos995 -=1){
    mg995.write(pos995);
    delay(20);
  }
  delay(100);
    for(pos90s_1=30;pos90s_1<=50;pos90s_1 +=1){
    mg90s_1.write(pos90s_1);
    delay(20);
  }
  delay(100);
    for(pos995_1=50;pos995_1<=110;pos995_1 +=1){
    mg995_1.write(pos995_1);
    delay(20);
  }
  delay(100);
    for(possg90=90;possg90<=140;possg90 +=1){
    sg90.write(possg90);
    delay(20);
  }
 
  
  /* aldýktan sonrasý */
   delay(100);
    for(pos995_1=110;pos995_1>=50;pos995_1 -=1){
    mg995_1.write(pos995_1);
    delay(20);
  }

  delay(100);
    for(pos995=20;pos995<=90;pos995 +=1){
    mg995.write(pos995);
    delay(20);
  }
  delay(100);
    for(pos995_1=50;pos995_1<=110;pos995_1 +=1){
    mg995_1.write(pos995_1);
    delay(20);
  }
    delay(100);
    for(possg90=140;possg90>=90;possg90 -=1){
    sg90.write(possg90);
    delay(20);
  }
  /* býraktýktan sonrasý */
    delay(20);
  for(pos995_1=110;pos995_1>=50;pos995_1 -=1){
    mg995_1.write(pos995_1);
    delay(20);
  }
  delay(20);
    for(pos90s=70;pos90s<=140;pos90s +=1){
    mg90s.write(pos90s);
    delay(20);
  }
  delay(20);
    
        for(pos90s_1=50;pos90s_1>=30;pos90s_1 -=1){
    mg90s_1.write(pos90s_1);
    delay(20);
  } delay(20);
    
   }

}