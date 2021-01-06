main() {
  //print(add(1, 2));
  //print(multiply(1, 2));
  print(calculation_1(1, 2, add));
  print(calculation_1(1, 2, multiply));
}

int calculation_1(int n1, int n2, Function f) {
  return f(n1, n2);
}

Function calculation_2 = (int n1, int n2, Function f) {
  return f(n1, n2);
};

int add(int n1, int n2) {
  return n1 + n2;
}

int multiply(int n1, n2) {
  return n1 * n2;
}