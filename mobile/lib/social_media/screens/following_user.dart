import 'package:flutter/material.dart';
import 'package:flutterapp/social_media/data/data.dart';
import 'package:flutterapp/social_media/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Container(
          height: 88,
          //color: Colors.red,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            itemCount: users.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              User usr = users[index];
              return GestureDetector(
                onTap: (){
                  print(usr.name);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 6.0
                      )
                    ],
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 60,
                      width: 60,
                      image: AssetImage(
                        usr.profileImageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
