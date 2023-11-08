import 'package:cinemasewa/constants.dart';
import 'package:cinemasewa/models/movie.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Movie movie;

  Details({required this.movie});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${movie.title}'),
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.4 * height,
              width: width,
              child: Image(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  image: NetworkImage('$imagepath${movie.backdrop_path}')),
            ),
            Text(
              'Name',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(movie.title),
            ),
            Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(movie.overview),
            ),
            Container(
              height: 30,
              width: 0.8 * width,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Release Date: '), Text(movie.relesedata)],
              ),
            ),
            Container(
              height: 30,
              width: 0.8 * width,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Rating'), Icon(Icons.star), Text(':')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(movie.voteavg.toStringAsFixed(2)),
                      Text('/10')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
