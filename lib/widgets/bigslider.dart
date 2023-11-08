import 'package:cinemasewa/constants.dart';
import 'package:cinemasewa/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BigSlider extends StatelessWidget {
  const BigSlider(
      {super.key,
      required this.width,
      required this.height,
      required this.snapshot});

  final double width;
  final double height;

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: CarouselSlider.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Details(movie: snapshot.data[itemIndex]);
                  }));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 0.4 * height,
                    width: 0.2 * height,
                    child: Image.network(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        '${imagepath}${snapshot.data[itemIndex].poster_path}'),
                  ),
                ),
              );
            },
            options: CarouselOptions(
                height: 0.35 * height,
                enlargeCenterPage: true,
                pageSnapping: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(seconds: 1),
                viewportFraction: 0.50,
                autoPlay: true)));
  }
}
