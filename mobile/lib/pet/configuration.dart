import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color PrimeryGreen = Color(0xff416d6d);

List<BoxShadow> shadowList = [
  BoxShadow(
    color: Colors.grey[300],
    blurRadius: 30,
    offset: Offset(0, 10),
  ),
];

List<Map> categories = [
  {'name': 'Cats', 'icon-path': 'images/pet/cat.png'},
  {'name': 'Dogs', 'icon-path': 'images/pet/dog.png'},
  {'name': 'Bunnies', 'icon-path': 'images/pet/bunny.png'},
  {'name': 'Cats', 'icon-path': 'images/pet/cat.png'},
  {'name': 'Dogs', 'icon-path': 'images/pet/dog.png'},
  {'name': 'Bunnies', 'icon-path': 'images/pet/bunny.png'},
  {'name': 'Cats', 'icon-path': 'images/pet/cat.png'},
  {'name': 'Dogs', 'icon-path': 'images/pet/dog.png'},
  {'name': 'Bunnies', 'icon-path': 'images/pet/bunny.png'},
];

List<Map> drawerItem = [
  {
    'icon': FontAwesomeIcons.paw,
    'title': 'Adoption',
  },
  {
    'icon': FontAwesomeIcons.voicemail,
    'title': 'Donation',
  },
  {
    'icon': Icons.favorite,
    'title': 'Favorite',
  },
  {
    'icon': Icons.mail,
    'title': 'Messages',
  },
  {
    'icon': FontAwesomeIcons.userAlt,
    'title': 'Profile',
  },

];
