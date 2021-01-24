const int in1=8;  /* motor sürücü devrsine baðlanacak arduino pinleri */  % sensör verisine baðlý olarak bant hareketini belirledik
const int in2=9; 
int sensorpin=7; /*kýzýlötesi sensör pin bacaðý*/
int deger=0;
void setup() {

  pinMode(sensorpin,INPUT);
  pinMode(in1,OUTPUT);
  pinMode(in2,OUTPUT);
}

void loop() {
  deger=digitalRead(sensorpin); %sensörümüz 1 deðeri yolladýðýnda 
  if(deger==HIGH){
    digitalWrite(in1,HIGH); %sensörümüz 1 deðeri yolladýðýnda 8. pini 1 e çektik 
    digitalWrite(in2,LOW); %sensörümüz 1 deðeri yolladýðýnda  9. pini 0 e çektik
    }
    else {                        %sensörümüz 0 deðeri yolladýðýnda 
    digitalWrite(in1,LOW); %8. pini 0 e çektik 
    digitalWrite(in2,LOW); %9. pini 0 e çektik 
    }

}