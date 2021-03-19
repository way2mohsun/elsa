import 'package:flutter/material.dart';
import 'package:flutterapp/food_delivery/main.dart' as food;
import 'package:flutterapp/bmi/bmi.dart';
import 'package:flutterapp/todoey/main.dart' as todoey;
import 'package:flutterapp/todoey/modules/task_list.dart';
import 'package:flutterapp/clima/main.dart' as clima;
import 'package:flutterapp/quizzler/Quizzler.dart' as quizzler;
import 'package:flutterapp/quizzler/Quizzler.dart' as quizzler;
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/social_media/main.dart' as social_media;
import 'package:flutterapp/dark_light/main.dart' as dark_light;
import 'package:flutterapp/budget/main.dart' as budget;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutterapp/slide_transition/home_page.dart' as slide_trans;
import 'package:flutterapp/circular_reveal/main.dart' as circular_reveal;
import 'package:flutterapp/pet/main.dart' as pet;
import 'dark_light/theme_provider.dart';
//import 'dark_light_2/' as dl;
import 'general/provider_2.dart';
import 'general/stack.dart' as stack;
import 'general/fade.dart' as fade;
import 'general/curved_navigation_bar.dart' as nav_bar;
import 'package:flutterapp/mi_card/mi_card_flutter_4.dart' as mi_card;
import 'package:flutterapp/chart/chart.dart' as chart;
import 'package:flutterapp/social_app/home_page.dart' as social_app;
import 'package:flutterapp/general/download.dart' as dow;
import 'package:flutterapp/diet/profile_screen.dart' as diet;
import 'package:flutterapp/covid/main.dart' as covid;
import 'package:flutterapp/responsive_ui/main.dart' as resp;
import 'package:flutterapp/online-book-reading/book_button.dart'
    as book_reading;
import 'package:flutterapp/whatsapp/send_text.dart' as wsm;
import 'package:flutterapp/chapter_1/main.dart' as c1;
import 'package:flutterapp/chapter_2/main.dart' as c2;
import 'package:flutterapp/switching-between-widget/switching_widget.dart'
    as sw;
import 'package:flutterapp/flight_list/main.dart' as fl;

void main() async {
  ///////// Only for dark_light app
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocumentsDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentsDirectory.path);
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get("isLightTheme") ?? false;
  ////////// Only for dark_light app

  runApp(_App(isLightTheme: isLightTheme));
}

class _App extends StatelessWidget {
  _App({this.isLightTheme});

  List<Object> apps = [];
  final List<int> colorCodes = <int>[
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    800,
    700,
    600,
  ];

  final List<String> entries = <String>[
    'Flight List',
    'Switch between Widgets',
    'Dark and light 2',
    'Simple Animation chapter 2',
    'Simple Animation chapter 1',
    'Send Whatsapp Text',
    'Online Book Reader',
    'Responsive UI',
    "Covid-19 Dashboard",
    'Diet',
    'Download',
    'Social App',
    'Chart',
    'Curved Navigation Bar',
    'fade',
    'Stack',
    'Pet',
    'circular reveal with progress button',
    'Slide Transition',
    'Provider 2',
    'Dark and Light',
    'Budget',
    'Social Media',
    'Quizzler',
    'Clima',
    'To-DO',
    'Food Delivery',
    'BMI Calculation',
    'MI Card',
  ];

  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    apps = [
      fl.HomeScreen(),
      sw.SwitchWidget(),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(isLightTheme: isLightTheme),
          ),
        ],
        child: dark_light.AppStart(),
      ),
      c2.MyApp(),
      c1.MyApp(),
      wsm.MyApp(),
      book_reading.OnlineBookReading(),
      resp.MyApp(),
      covid.MyApp(),
      diet.ProfileScreen(),
      dow.Download(),
      social_app.HomePage(),
      chart.MyApp(),
      nav_bar.MyApp(),
      fade.FadeTransitionSample(),
      stack.Stacks(),
      pet.HomePage(),
      circular_reveal.MyApp(),
      slide_trans.HomePage(),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Data()),
        ],
        child: Providers(),
      ),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(isLightTheme: isLightTheme),
          ),
        ],
        child: dark_light.AppStart(),
      ),
      budget.MyApp(),
      social_media.MyApp(),
      quizzler.Quizzler(),
      clima.MyApp(),
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TaskList()),
        ],
        child: todoey.MyApp(),
      ),
      food.MyApp(),
      BMICalculator(),
      mi_card.MyCard(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => apps[index],
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(
                    child: Text('${entries[index]}'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
