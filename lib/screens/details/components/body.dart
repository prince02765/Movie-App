import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import 'backdrop_rating.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  
  final List trending;
  final int index;

  const Body({Key key, this.trending, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size, trending: trending, index: index),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(trending: trending, index: index),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              "Overview",
              style:TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.montserrat().fontFamily
              ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              trending[index]['overview'],
              style: TextStyle(
                color: Color(0xFF737599),
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
