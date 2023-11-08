import 'package:cinemasewa/models/movie.dart';

import 'package:cinemasewa/widgets/bigslider.dart';
import 'package:cinemasewa/widgets/smallslider.dart';
import 'package:flutter/material.dart';
import 'package:cinemasewa/services/service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> trendingmovie;
  late Future<List<Movie>> popularmovie;
  late Future<List<Movie>> nowplaying;
  late Future<List<Movie>> upcomming;
  late Future<List<Movie>> toprated;
  @override
  void initState() {
    super.initState();
    trendingmovie = Service().gettrendingmovie();
    popularmovie = Service().getpopularmovie();
    nowplaying = Service().getnowplaying();
    upcomming = Service().getupcomming();
    toprated = Service().gettoprated();
    print('this is a init method');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinema Sewa',
          style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
        ),
        centerTitle: true,
        elevation: 40,
      ),
      /* floatingActionButton: FloatingActionButton(
        elevation: 40,
        onPressed: () {},
        child: Icon(
          Icons.search,
          size: 30,
        ),
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treanding movies',
                style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: FutureBuilder(
                future: trendingmovie,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return BigSlider(
                      width: width,
                      height: height,
                      snapshot: snapshot,
                    );
                  }
                },
              )),
              Text(
                'Now playing',
                style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
              ),
              SizedBox(
                  child: FutureBuilder(
                future: nowplaying,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SmallSlider(width: width, snapshot: snapshot);
                  }
                },
              )),
              Text(
                'Top Rated',
                style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
              ),
              SizedBox(
                  child: FutureBuilder(
                future: toprated,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SmallSlider(width: width, snapshot: snapshot);
                  }
                },
              )),
              Text(
                'popular movies',
                style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
              ),
              SizedBox(
                  child: FutureBuilder(
                future: popularmovie,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SmallSlider(width: width, snapshot: snapshot);
                  }
                },
              )),
              Text(
                'Upcomming  movies',
                style: TextStyle(color: Color(0xffb9b9b9), fontSize: 18),
              ),
              SizedBox(
                  child: FutureBuilder(
                future: upcomming,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SmallSlider(width: width, snapshot: snapshot);
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

// create an variable called movie which will be movie type 

// i could use that type of data like eg movie.name etc tc 