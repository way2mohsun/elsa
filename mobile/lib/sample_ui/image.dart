import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//https://flutter.dev/docs/catalog/samples/basic-app-bar
//https://material.io/design/color/the-color-system.html#tools-for-picking-colors
//https://api.flutter.dev/flutter/material/Scaffold/Scaffold.html

void main() => runApp(
  MaterialApp(
//home is main item in screen
      home: Scaffold(
//backgroundColor: Colors.green[300],
        appBar: AppBar(
          backgroundColor: Colors.lime[600],
          title: Text('I am rich'),
        ),
        body: Center(
//https://appicon.co/
          child: (
              SvgPicture.network("https://www.plantuml.com/plantuml/svg/NP1BRy9038Jl-HKMXzwAUFGKfKWG-a0gAYAjUYXLPH8NLbrsqxMZFdvzTo60agk_ySpOeaHJ3FTMOAAqZafqed9LeX7e9Ap-A1xsHib5IOwj6NK0a86hDLXNa8D-O-4vowQ1Lyn5BHWq13UpSU2xxveE6tIso09L9TVuAWf9bwE3OGnB-gg81SJ20tBTUC-ynfl6i24PvxcjZ4n9K6cE_FXia5REaP7t2MeqEKMefJs3n1zrz0pnyJu6jhxPciX0YQhehinhhYqJo9Q0YLbPynQHAGwhoMatjUP3kHsA5vnimuKnt9700dztFXpcjY1uB8EAeu3FdO_JPgT-TuBcSsK6tHVKcgJrgOmqvGAjn1HBgHmTKrVc2NzkDMxW6dgjr2LnfQKLElU7ueR-0G00",)
          ),
//Image(
//image: NetworkImage("http://www.plantuml.com/plantuml/svg/SyfFKj2rKt3CoKnELR1Io4ZDoSa70000"),
//image: AssetImage("img/me.jpg"),
//),
        ),
      )),
);
