import 'package:flutter/material.dart';
import 'package:flutterapp/social_media/models/user_model.dart';
import 'package:flutterapp/social_media/screens/custom_drover.dart';
import 'package:flutterapp/social_media/screens/posts_carouse.dart';
import 'package:flutterapp/social_media/screens/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  PageController _yourPost;
  PageController _yourFavorite;

  @override
  void initState() {
    super.initState();
    _yourPost = PageController(initialPage: 0, viewportFraction: 0.8);
    _yourFavorite = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 30,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 33,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _scaffoldState.currentState.openDrawer();
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarouse(
              title: 'Your Post',
              pageController: _yourPost,
              posts: widget.user.posts,
            ),
            //PostsCarouse(),
          ],
        ),
      ),
    );
  }
}
