int switch_pin = 7;

void setup(){

Serial.beign(9600);

pinMode(switch_pin, INPUT);

}

void loop(){

    if(digitalRead(switch_pin) == LOW) {

        Serial.printIn(0);

    } else {

        Serial.printIn(1);
    }

    delay (10000);

}