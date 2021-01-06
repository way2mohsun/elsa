import 'package:flutter/material.dart';
import 'package:flutterapp/social_media/data/data.dart';
import 'package:flutterapp/social_media/screens/home_screen.dart';
import 'package:flutterapp/social_media/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildDrawerOption({Icon icone, String title, Function onTab}) {
      return ListTile(
        leading: icone,
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        onTap: onTab,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            icone: Icon(Icons.dashboard),
            title: "Home",
            onTab: () {
              //print('Home');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return HomeScreen();
                  },
                ),
              );
            },
          ),
          _buildDrawerOption(
            icone: Icon(Icons.chat),
            title: "Chat",
            onTab: () {},
          ),
          _buildDrawerOption(
            icone: Icon(Icons.location_on),
            title: "Location",
            onTab: () {},
          ),
          _buildDrawerOption(
            icone: Icon(Icons.account_circle),
            title: "Your Profile",
            onTab: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return ProfileScreen(user: currentUser);
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                  icone: Icon(Icons.directions_run),
                  title: "Logout",
                  onTab: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
