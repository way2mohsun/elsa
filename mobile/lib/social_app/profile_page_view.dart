import 'package:flutter/material.dart';
import 'package:flutterapp/general/stack.dart';
import 'package:flutterapp/social_app/profile.dart';
import 'package:flutterapp/social_app/two_line_item.dart';

class ProfilePageView extends StatefulWidget {
  final opacity = .4;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _slidAnimation;
  Animation _fadeAnimation;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slidAnimation = TweenSequence(
      [
        TweenSequenceItem<Offset>(
          weight: 10,
          tween: Tween(
            begin: Offset(0, 0),
            end: Offset(0, 1),
          ),
        ),
        TweenSequenceItem<Offset>(
          weight: 90,
          tween: Tween(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ),
        ),
      ],
    ).animate(_controller);
    _fadeAnimation = TweenSequence(
      [
        TweenSequenceItem<double>(
          weight: 10,
          tween: Tween(
            begin: 1,
            end: 0,
          ),
        ),
        TweenSequenceItem<double>(
          weight: 90,
          tween: Tween(
            begin: 0,
            end: 1,
          ),
        ),
      ],
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: profiles.length,
          controller: widget._pageController,
          pageSnapping: true,
          onPageChanged: (index) {
            currentIndex = index;
            _controller.reset();
            _controller.forward();
            setState(() {});
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  profiles[index].image,
                  fit: BoxFit.cover,
                  color: Colors.black,
                  colorBlendMode: BlendMode.hue,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(widget.opacity),
                        Colors.white.withOpacity(widget.opacity),
                        Colors.black.withOpacity(widget.opacity),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: ProfileDetail(
            index: currentIndex,
            slidAnimation: _slidAnimation,
            fadeAnimation: _fadeAnimation,
          ),
        ),
      ],
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final int index;
  final Animation slidAnimation;
  final Animation fadeAnimation;

  ProfileDetail({
    this.index,
    this.slidAnimation,
    this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slidAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            TwoLineItems(
              crossAxisAlignment: CrossAxisAlignment.start,
              first_text: profiles[index].followers.toString(),
              second_text: 'followers',
            ),
            TwoLineItems(
              crossAxisAlignment: CrossAxisAlignment.center,
              first_text: profiles[index].posts.toString(),
              second_text: 'posts',
            ),
            TwoLineItems(
              crossAxisAlignment: CrossAxisAlignment.end,
              first_text: profiles[index].following.toString(),
              second_text: 'following',
            ),
          ],
        ),
      ),
    );
  }
}
