import 'package:flutter/material.dart';
import 'package:flutterapp/online-book-reading/constraints.dart';
import 'package:flutterapp/online-book-reading/home_screen.dart';
import 'package:flutterapp/online-book-reading/rounded_button.dart';

class OnlineBookReading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/book-reading/Bitmap.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline2,
                children: [
                  TextSpan(
                    text: 'Flamin',
                  ),
                  TextSpan(
                    text: 'go',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.maybeOf(context).size.width * .6,
              child: RoundedButton(
                fontSize: 16,
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }),
                  );
                },
                text: 'Start reading',
                verticalPadding: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
