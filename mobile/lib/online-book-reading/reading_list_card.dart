import 'package:flutter/material.dart';
import 'package:flutterapp/online-book-reading/two_side_rounded_button.dart';

import 'book_rating.dart';
import 'constraints.dart';

class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetail;
  final Function pressRead;
  const ReadingListCard({
    Key key,
    this.image,
    this.auth,
    this.rating,
    this.pressDetail,
    this.pressRead,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, bottom: 40),
      height: MediaQuery.of(context).size.width * .6,
      width: 202,
      child: Stack(
        children: [
          Container(
            //height: 260,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 30,
                  color: kShadowColor,
                ),
              ],
            ),
          ),
          Image.asset(
            image,
            width: 140,
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Column(
              children: [
                IconButton(
                  onPressed: pressDetail,
                  icon: Icon(Icons.favorite_border),
                ),
                BookRating(score: rating),
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 70,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: const TextStyle(color: kBlackColor),
                        children: [
                          TextSpan(
                            text: title + '\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: auth,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 101,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text('Detail'),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          onPress: pressRead,
                          radius: 29,
                          text: 'Read',
                        ),
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
}
