import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  final List trending;
  final int index;

  const TitleDurationAndFabBtn({Key key, this.trending, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  trending[index]['title']!=null ? trending[index]['title'] : trending[index]['name'],
                  style:TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.montserrat().fontFamily
                  ),   
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      trending[index]['release_date']!=null ? trending[index]['release_date']: trending[index]['first_air_date'],
                      style: TextStyle(
                        color: kTextLightColor,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "PG-13",
                      style: TextStyle(
                        color: kTextLightColor,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "2h 32min",
                      style: TextStyle(
                        color: kTextLightColor,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
