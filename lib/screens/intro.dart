import 'dart:async';

import 'package:cinemasewa/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    height: 0.5 * height,
                    width: 0.5 * width,
                    child: Image(image: AssetImage('assets/movie.png')),
                  ),
                  builder: ((context, child) => Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      ))),
            ),
            SizedBox(
              height: 0.1 * height,
            ),
            Text(
              'Cinema sewa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              'Made By Manoj Bhatta',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              'powered by themoviedb',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
