import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_shape_clipper.dart';
import 'package:intl/intl.dart';

import 'flight_list.dart';

final formatCurrency = NumberFormat.simpleCurrency();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      //   child: BottomNavigationBar(
      //     onTap: (index) {
      //       print(index);
      //     },
      //     currentIndex: 1,
      //     iconSize: 40,
      //     selectedIconTheme: IconThemeData(color: const Color(0xff200087)),
      //     unselectedItemColor: Colors.black54,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenTopPart(),
            HomeScreenButtonPart(),
          ],
        ),
      ),
    );
  }
}

class HomeScreenButtonPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Watched item',
                style: dropDownMenuItemStyle,
              ),
              Text(
                'View all',
                style: viewAllStyle,
              ),
            ],
          ),
          Container(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cities,
            ),
          ),
        ],
      ),
    );
  }
}

List<CityCard> cities = [
  CityCard(
    city: "Tabriz",
    discount: "10",
    image: "images/social_media/post0.jpg",
    month: "2",
    newPrice: 1200,
    oldPrice: 1800,
  ),
  CityCard(
    city: "Tehran",
    discount: "20",
    image: "images/social_media/post1.jpg",
    month: "5",
    newPrice: 1000,
    oldPrice: 990,
  ),
];

class CityCard extends StatelessWidget {
  final String image, city, month, discount;
  final int newPrice, oldPrice;

  const CityCard({
    Key key,
    this.image,
    this.city,
    this.month,
    this.discount,
    this.newPrice,
    this.oldPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    height: 180,
                    width: 200,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  width: 200,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black38,
                          Colors.black.withOpacity(.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10, ///// very important
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            city,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            month,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          '%$discount',
                          style: TextStyle(
                            //color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Text(
                '${formatCurrency.format(newPrice)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 15),
              Text(
                '${formatCurrency.format(oldPrice)}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

Color firstColor = Color(0xfff47d15);
Color secondColor = Color(0xffff772c);
List<String> locations = ['Tabriz', 'Baku'];
const TextStyle dropDownLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);
const TextStyle dropDownMenuItemStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
);
const TextStyle viewAllStyle = TextStyle(
  color: Colors.orange,
  fontSize: 18,
);

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  int selectedLocationIndex = 0;
  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              //color: Colors.orange,
              height: 450,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    firstColor,
                    secondColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocationIndex = index;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            List<PopupMenuItem<int>> items = [];
                            items.add(
                              PopupMenuItem(
                                child: Text(
                                  locations[0],
                                  style: dropDownMenuItemStyle,
                                ),
                                value: 0,
                              ),
                            );
                            items.add(
                              PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropDownMenuItemStyle,
                                ),
                                value: 1,
                              ),
                            );
                            return items;
                          },
                          child: Row(
                            children: [
                              Text(
                                locations[selectedLocationIndex],
                                style: dropDownLabelStyle,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            print('here');
                          },
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 5),
                  Text(
                    'where would\nyou want to go?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        style: dropDownMenuItemStyle,
                        controller: TextEditingController(text: locations[0]),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 33, vertical: 17),
                          suffixIcon: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FlightListingScreen(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ChooseCheap(
                        icon: Icons.flight_takeoff,
                        text: "Flights",
                        isFlightSelected: isFlightSelected,
                      ),
                      SizedBox(width: 10),
                      ChooseCheap(
                          icon: Icons.hotel,
                          text: "Hotels",
                          isFlightSelected: !isFlightSelected),
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
}

class ChooseCheap extends StatefulWidget {
  final IconData icon;
  final String text;
  bool isFlightSelected;

  ChooseCheap({this.icon, this.text, this.isFlightSelected});
  @override
  _ChooseCheapState createState() => _ChooseCheapState();
}

class _ChooseCheapState extends State<ChooseCheap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
      decoration: widget.isFlightSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            )
          : null,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isFlightSelected = !widget.isFlightSelected;
          });
        },
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
