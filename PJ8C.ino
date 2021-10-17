//Input Ports for each finger
//Check board to see labels
int fing1 = A0;
int fing2 = A1;
int fing3 = A2;
int fing4 = A3;
int fing5 = A4;

//The analog data recorded in each finger
int data1 = 0;
int data2 = 0;
int data3 = 0;
int data4 = 0;
int data5 = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  //Sets up the pins for measuring
  pinMode(fing1, INPUT);
  pinMode(fing2, INPUT);
  pinMode(fing3, INPUT);
  pinMode(fing4, INPUT);
  pinMode(fing5, INPUT);

  //Prints labels on graphs
  Serial.println("Min,Max,Finger1,Finger2,Finger3,Finger4,Finger5");
}

void loop() {
  // put your main code here, to run repeatedly:

  //Continually reads the sensors
  data1 = analogRead(fing1);
  data2 = analogRead(fing2);
  data3 = analogRead(fing3);
  data4 = analogRead(fing4);
  data5 = analogRead(fing5);

  //Sets min and max boundries for graph
  Serial.print(250);
  Serial.print(',');
  Serial.print(500);
  Serial.print(',');

  //Shows data for each finger
  /*
  Serial.println(data1);
  Serial.print(',');
  Serial.print(data2);
  Serial.print(',');
  Serial.print(data3);
  Serial.print(',');
  Serial.print(data4);
  Serial.print(',');
  */
  Serial.print(data5);
  
  Serial.println();
  //delay(1000);

}
