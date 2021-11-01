import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyApp();
}


class _MyApp extends State<HomePage> {
  List trendingMovies = [];
  final String apiKey = "fcd927f200fc6891df1219fd88fa24b3";
  final accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmY2Q5MjdmMjAwZmM2ODkxZGYxMjE5ZmQ4OGZhMjRiMyIsInN1YiI6IjYxN2I0ZjJiM2Y3ZTFkMDAyYzNkNTBjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IJRXPFNKe4z9aoSUIMdT-RtE_2djktNMLH5F7_3FozI";

  void initState() {
    super.initState();
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
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
  
}
