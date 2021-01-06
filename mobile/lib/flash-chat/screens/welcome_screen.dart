import 'package:flutter/material.dart';
import 'package:flutterapp/flash-chat/components/rounded_buttom.dart';
import 'package:flutterapp/flash-chat/screens/login_screen.dart';
import 'package:flutterapp/flash-chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
      //upperBound: 100, // if we want to use Animation we have to remove this property
    );
    /*
      animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutBack,
      );
     */

    //Changing animation.value for color

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    //controller.reverse(from : 1.0);  // end with AnimationStatus.dismissed
    controller.repeat(min: 0.0, max: 1.0, ); // AnimationStatus.completed
    controller.addListener(() {
      setState(() {
        //print('controller : $controller.value');
        //print('animation : $animation.value');
      });
    });
    // Animation Listener
    animation.addStatusListener((status) {

      if(status == AnimationStatus.dismissed) {
        controller.forward();
      } else if (status == AnimationStatus.completed) {
        controller.reverse(from : 1.0);
      }

    });
  }
//1.AnimationStatus.dismissed 2.AnimationStatus.completed
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red.withOpacity(controller.value),
      //backgroundColor: Colors.white,
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('image/img/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    //default controller.value 0.0 till 1.0
                  //'${controller.value.toInt()}',
                  speed: Duration(milliseconds: 500),
                  repeatForever: false,
                  text: ['Flash Text'],
                  textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                //Text('Hi'),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButtom(
              color: Colors.lightBlueAccent,
              title: 'Log in',
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (Container) => LoginScreen(),),);
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButtom(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (Container) => RegistrationScreen(),),);
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
