import 'package:flutter/material.dart';
import 'animated_button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: AnimatedButton(
            onTab: (){
              print('Pressed the button.');
            },
            animationDuration: const Duration(milliseconds: 2000),
            initialText: "Confirm",
            finalText: "Submit",
            iconData: Icons.check,
            iconSize: 32,
            buttonStyle: ButtonStyleUtil(
              primaryColor: Colors.green.shade600,
              secondaryColor: Colors.white,
              elevation: 20,
              initialTextStyle: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              finalTextStyle: TextStyle(
                fontSize: 24,
                color: Colors.green.shade600,
              ),
              borderRadious: 10,
            ),
          ),
        ),
      ),
    );
  }
}
