import 'package:flutter/material.dart';
import 'package:flutterapp/general/provider_2.dart';
import 'package:flutterapp/todoey/screens/tasks_screens.dart';
import 'package:provider/provider.dart';

import 'modules/task_list.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}
