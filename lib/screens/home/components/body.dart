import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'categories.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Categorylist(),
          SizedBox(height: kDefaultPadding*2),
          MovieCarousel(),
        ],
      ),
    );
  }
}
