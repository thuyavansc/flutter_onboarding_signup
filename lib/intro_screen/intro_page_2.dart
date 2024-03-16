
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Intro Page 1'),
              // Load a Lottie file from your assets
              Lottie.asset('assets/lottie/taxi_moving_1710583217099.json'),
            ],
          )
      ),

    );
  }
}