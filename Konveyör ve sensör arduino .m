const int in1=8;  /* motor s�r�c� devrsine ba�lanacak arduino pinleri */  % sens�r verisine ba�l� olarak bant hareketini belirledik
const int in2=9; 
int sensorpin=7; /*k�z�l�tesi sens�r pin baca��*/
int deger=0;
void setup() {

  pinMode(sensorpin,INPUT);
  pinMode(in1,OUTPUT);
  pinMode(in2,OUTPUT);
}

void loop() {
  deger=digitalRead(sensorpin); %sens�r�m�z 1 de�eri yollad���nda 
  if(deger==HIGH){
    digitalWrite(in1,HIGH); %sens�r�m�z 1 de�eri yollad���nda 8. pini 1 e �ektik 
    digitalWrite(in2,LOW); %sens�r�m�z 1 de�eri yollad���nda  9. pini 0 e �ektik
    }
    else {                        %sens�r�m�z 0 de�eri yollad���nda 
    digitalWrite(in1,LOW); %8. pini 0 e �ektik 
    digitalWrite(in2,LOW); %9. pini 0 e �ektik 
    }

}