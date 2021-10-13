int flexPin = A0;
int led1 = 13;
int led2 = 12;
int led3 = 11;
int data = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(flexPin, INPUT);
  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(led3,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  data = analogRead(flexPin);
  Serial.print(data);

  //Starts Finger Curl
  if(data >450)
  {
    digitalWrite(led1,LOW);
  }
  if(data <= 450)
  {
    digitalWrite(led1,HIGH);
  }

  //Mid way
    if(data >370)
  {
    digitalWrite(led2,LOW);
  }
  if(data <=370)
  {
    digitalWrite(led2,HIGH);
  }

  //fully Curled
  if(data >320)
  {
    digitalWrite(led3,LOW);
  }
   if(data <=320)
  {
    digitalWrite(led3,HIGH);
  }

  delay(1000);

}
