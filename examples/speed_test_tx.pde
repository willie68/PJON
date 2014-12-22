#include <PJON.h>
float test;
float mistakes;

PJON network(A0, 44);

void setup() {
  Serial.begin(115200);
  network.set_collision_avoidance(true);
  network.set_acknowledge(true);
  network.set_encryption(false);
}

void loop() {
  long time = millis();
  while(millis() - time < 10000) {
  if(network.send_string(44, "1234567890") == 6)
    test++;
  else
   mistakes++;
}
 Serial.print("Absolute com speed: ");
 Serial.print( (test * 15 ) / 10 );
 Serial.print(" b/s |Practical bandwidth: ");
 Serial.print( (test * 10 ) / 10 );
 Serial.print(" b/s |Packets sent: ");
 Serial.print(test);
 Serial.print(" |Mistakes ");
 Serial.print(mistakes);
 Serial.print(" |Accuracy: ");
 Serial.println(100 - (100 / (test / mistakes)));
 test = 0; 
 mistakes = 0;
}
