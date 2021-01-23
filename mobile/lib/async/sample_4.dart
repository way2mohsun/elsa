void main() {
  performTasks();
}

void performTasks() async {
  task1();
  task3(await task2());
}

void task1() {
  print('Task 1 complete');
}

Future task2() async {
  Duration d = Duration(seconds: 3);
  //var result;
  var result = await Future.delayed(d, () {
    print('Task 2 complete');
    return "TSK 2";
  });
  return result;
}

void task3(String task_2_data) {
  print('Task 3 complete with $task_2_data');
}
