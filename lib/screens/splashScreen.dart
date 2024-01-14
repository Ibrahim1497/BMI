import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';

import 'bmiCalculator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.black26,
        splash: Center(
            child: RippleAnimation(
                color: Colors.orange,
                ripplesCount: 5,
                minRadius: 150,
                size: const Size(150, 150),
                child: Center(
                  child: Icon(
                    Icons.calculate_outlined,
                    size: 100,
                    color: Colors.blue,
                  ),
                ))),
        nextScreen: BMICalculatorScreen());
  }
}
