main() {
  Car c = Car(drive: slow_drive);
  print(c.drive);
  c.drive();
  print(c.drive()); // wrong : output will be null value

  c.drive = fast_drive;
  c.drive();
}

class Car {
  Function drive;

  Car({this.drive});
}

void slow_drive() {
  print('drive slowly.');
}

void fast_drive() {
  print('drive fast.');
}
