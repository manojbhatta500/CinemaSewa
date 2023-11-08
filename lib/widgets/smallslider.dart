import 'package:cinemasewa/constants.dart';
import 'package:cinemasewa/screens/details.dart';
import 'package:flutter/material.dart';

class SmallSlider extends StatelessWidget {
  const SmallSlider({super.key, required this.width, required this.snapshot});

  final AsyncSnapshot snapshot;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Details(movie: snapshot.data[index]);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 130,
                    height: 160,
                    child: Image.network(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        '${imagepath}${snapshot.data[index].poster_path}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
