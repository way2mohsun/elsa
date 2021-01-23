import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';
import 'main.dart';

final Color discoundBackgroundColor = Color(0xffffe08d);
final Color flightBorderColor = Color(0xffe6e6e6);
final Color cheepBackgroundColor = Color(0xfff6f6f6);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Search Result'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xfff47d15),
      ),
      body: Column(
        children: [
          FlightListTopPart(),
        ],
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              //color: Colors.orange,
              gradient: LinearGradient(
                colors: [
                  firstColor,
                  secondColor,
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(16),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Boston',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20,
                          ),
                          Text(
                            'New Yourk City',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.import_export, size: 42),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
