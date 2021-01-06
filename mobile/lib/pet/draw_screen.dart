import 'package:flutter/material.dart';

import 'configuration.dart';

class DrawScreen extends StatefulWidget {
  @override
  _DrawScreenState createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimeryGreen,
      padding: EdgeInsets.only(top: 50, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohsen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: drawerItem
                  .map((e) => Row(
                        children: [
                          Icon(
                            e['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            e['title'],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),)
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 20,
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
