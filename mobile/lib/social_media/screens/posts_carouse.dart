import 'package:flutter/material.dart';
import 'package:flutterapp/general/container.dart';
import 'package:flutterapp/social_media/models/post_model.dart';
import 'package:geolocator/geolocator.dart';

class PostsCarouse extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarouse({this.pageController, this.title, this.posts});

  @override
  Widget build(BuildContext context) {
    _buildPosts(BuildContext context, int index) {
      Post post = posts[index];
      return AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - index;
            value = (1 - (value.abs() * 0.30).clamp(0.0, 1.0));
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * 400,
              child: widget,
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  height: 400,
                  width: 300,
                  image: AssetImage(post.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              right: 60,
              child: Container(
                padding: EdgeInsets.all(12),
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      post.location,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text(
                              post.likes.toString(),
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  post.likes.toString(),
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Posts',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPosts(context, index);
            },
          ),
        ),
      ],
    );
  }
}
