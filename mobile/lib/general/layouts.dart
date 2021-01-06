import 'package:flutter/material.dart';

main() {
  runApp(Material_());
}

class Material_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('shape: BeveledRectangleBorder')),
      body: Center(
        child: Material(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.black, width: 4),
          ),
          color: Colors.yellow,
          child: Container(
            height: 200,
            width: 200,
          ),
        ),
      ),
    ));
  }
}

class gradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('gradient: LinearGradient')),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                colors: const [
//                  Colors.red,
//                  Colors.blue,
//                ],
//              ),
//              gradient: RadialGradient(
//                colors: const [Colors.yellow, Colors.blue],
//                stops: const [0.4, 1.0],
//              ),
              gradient: SweepGradient(
                colors: const [
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.blue,
                ],
                stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BoxDecoration_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('image: DecorationImage')),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              //border: Border.all(color: Colors.black, width: 3),
              //borderRadius: BorderRadius.all(Radius.circular(18)),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(blurRadius: 10),
              ],
              gradient: LinearGradient(
                colors: const [
                  Colors.red,
                  Colors.blue,
                ],
              ),
              color: Colors.yellow,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1cFE4oxgHj_wG4woww1CTQrwRZBbdJvuoQi1m8qQF1Ruzctw&s',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Transform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container.transform')),
        body: Container(
          height: 300,
          width: 300,
          foregroundDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
          ),
          transform: Matrix4.rotationZ(0.88),
          //use 0, 0.1 0.2 0.3
          decoration: BoxDecoration(color: Colors.yellowAccent),
          child: Text(
            "Hi",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ForegroundDecoration_ extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container.foregroundDecoration')),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.yellow),
          foregroundDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
          ),
          child: Text("Hi"),
        ),
      ),
    );
  }
}

class Rows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: iconList),
    );
  }
}

class Align_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Align: without Align')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              child: RaisedButton(
                onPressed: () {},
                child: const Text('Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConstrainedBox_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: 100,
            height: 100,
          ),
          child: const Card(
            child: const Text('Hello World!'),
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class Expaned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.red),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.green),
              ),
              flex: 2,
            ),
            Card(
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stacks_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const iconSize = 50.0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack with LayoutBuilder')),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Material(color: Colors.yellowAccent),
              Positioned(
                top: 0,
                child: Icon(Icons.star, size: iconSize),
              ),
              Positioned(
                top: constraints.maxHeight - iconSize,
                left: constraints.maxWidth - iconSize,
                child: Icon(Icons.call, size: iconSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Stacks_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack')),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Material(color: Colors.yellowAccent),
            Positioned(
              top: 0,
              left: 0,
              child: Icon(Icons.star, size: 50),
            ),
            Positioned(
              top: 340,
              left: 250,
              child: Icon(Icons.call, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class Intrinsic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('IntrinsicWidth')),
        body: Center(
          child: IntrinsicWidth(
            // all width are same
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Short'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('A bit Longer'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('The Longest text button'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Layouts_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
          ],
        ),
      ),
    );
  }
}

class Layouts_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text('Container 1'),
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
              ),
              Container(
                child: Text('Container 2'),
                color: Colors.teal,
                width: 100.0,
                height: 100.0,
              ),
              Container(
                child: Text('Container 3'),
                color: Colors.green,
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Layouts_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.teal,
                child: Text('1'),
                height: 100.0,
                width: 100,
              ),
            ),
            Container(
              color: Colors.red,
              child: Text('2'),
              height: 100.0,
              width: 100,
            ),
            Container(
              color: Colors.blue,
              child: Text('3'),
              height: 100.0,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);

final descTextStyle = TextStyle(
  color: Colors.white,
  backgroundColor: Colors.white,
  fontWeight: FontWeight.w800,
  //fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 2,
);

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
final iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.kitchen, color: Colors.green[500]),
            Text(
              'PREP:',
            ),
            Text('25 min'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.green[500]),
            Text('COOK:'),
            Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.restaurant, color: Colors.green[500]),
            Text('FEEDS:'),
            Text('4-6'),
          ],
        ),
      ],
    ),
  ),
);
