import 'package:flutter/material.dart';
import 'package:flutterapp/diet/upper_body_workout.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatelessWidget {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  "${DateFormat("EEEEE").format(today)}, ${DateFormat("d MMM").format(today)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Upper Body",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white30,
                        ),
                        Text(
                          '60 min',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.wifi_protected_setup,
                          color: Colors.white30,
                        ),
                        Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < upper_body.length; i++)
                Column(
                  children: [
                    for (int j = 0; j < upper_body[i].length; j++)
                      ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            upper_body[i][j].image,
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF584d9d),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        title: Text(
                          upper_body[i][j].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          upper_body[i][j].instruction,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
