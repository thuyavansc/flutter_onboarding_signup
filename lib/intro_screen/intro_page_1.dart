
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Intro Page 1'),
              // Load a Lottie file from your assets
              Lottie.asset('assets/lottie/taxi_1710580597515.json'),
            ],
          )
      ),
    );
  }
}
