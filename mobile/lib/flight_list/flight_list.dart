import 'package:flutter/material.dart';

final Color discoundBackgroundColor = Color(0xffffe08d);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color cheepBackgroundColor = Color(0xfff6f6f6);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
