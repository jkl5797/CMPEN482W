int flex = A0;
int data = 0;
//set led 2
int led = 13;

void setup() 
{
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(flexs, INPUT);
  pinMode(led, OUTPUT);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  data = analogRead(flexs);
  Serial.println(data);

  if(data <= 100)
  {
    //turn on different or both led
  }
  
  if( data <= 200)
  {
    
    digitalWrite(led, HIGH);
  }

  delay(100);
  
}

  
