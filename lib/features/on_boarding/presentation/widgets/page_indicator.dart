import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget smoothPageIndicator(BuildContext context,PageController pageController) {
  return SmoothPageIndicator(

    controller: pageController,
    count: 3,
    effect: JumpingDotEffect(),
  );
}