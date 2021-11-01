import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tmdb_api/tmdb_api.dart';
import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  final int index;
  const MovieCarousel({Key key, this.index}) : super(key: key);
  
  @override
  _MovieCarouselState createState() => _MovieCarouselState(index);
}

class _MovieCarouselState extends State<MovieCarousel> {
  final int index;

  _MovieCarouselState(this.index);

  PageController _pageController;
  int initialPage = 1;

  List trendingMovies = [];
  final String apiKey = "fcd927f200fc6891df1219fd88fa24b3";
  final accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmY2Q5MjdmMjAwZmM2ODkxZGYxMjE5ZmQ4OGZhMjRiMyIsInN1YiI6IjYxN2I0ZjJiM2Y3ZTFkMDAyYzNkNTBjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IJRXPFNKe4z9aoSUIMdT-RtE_2djktNMLH5F7_3FozI";

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apiKey, accessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));
    Map trendingResults = await tmdb.v3.trending.getTrending();

    setState(() {
      trendingMovies = trendingResults['results']; 
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: trendingMovies.length,
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }

          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(trending: trendingMovies, index: index),
              ),
            );
        },
      );
}
