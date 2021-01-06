import 'package:flutter/material.dart';
import 'package:flutterapp/flash-chat/screens/welcome_screen.dart';
import 'package:flutterapp/flash-chat/screens/login_screen.dart';
import 'package:flutterapp/flash-chat/screens/registration_screen.dart';
import 'package:flutterapp/flash-chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
       */
      initialRoute: WelcomeScreen.id, // or home: WelcomeScreen()
      // if we use route with slash, at least one empty slash is mandatory
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ChatScreen.id : (context) => Center(child: ChatScreen()),
      },
    );
  }
}
