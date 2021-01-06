import 'package:flutter/material.dart';
import 'package:flutterapp/dark_light/home_page.dart';
import 'package:flutterapp/dark_light/theme_provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

main() async {
  //a real app may wait for data from the native side before calling runApp
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocumentsDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentsDirectory.path);
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get("isLightTheme") ?? false;
  runApp(
    // ChangeNotifierProvider(
    //   create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    //   child: AppStart(),
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isLightTheme: isLightTheme),
        ),
      ],
      child: AppStart(),
    ),
  );
}

// to ensure, we have the themeProvider before the app starts
class AppStart extends StatelessWidget {
  AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(themeProvider: themeProvider);
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Light Dark Theme",
      theme: widget.themeProvider.themeData(),
      home: HomePage(),
    );
  }
}
