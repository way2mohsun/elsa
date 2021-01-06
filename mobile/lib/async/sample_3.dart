//import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // point : we are passing future to task 3
  //String result = await task2().toString();

  //point : task 3 will wait task 2
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}
//Future like ticket in restaurant
Future<String> task2()  async {
  Duration d = Duration(seconds: 3);
  String result;
  await Future.delayed(d, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task_2_data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task_2_data');
}