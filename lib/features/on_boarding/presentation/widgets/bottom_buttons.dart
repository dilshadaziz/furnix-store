import 'package:clean_architecture/features/on_boarding/presentation/widgets/circle_button.dart';
import 'package:clean_architecture/features/on_boarding/presentation/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

Positioned bottomButtons(
    BuildContext context, PageController pageController, int currentPageIndex) {
  return Positioned(
      bottom: 30,
      right: 20,
      left: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          circleButtonLeft(context, pageController, currentPageIndex),
          smoothPageIndicator(context, pageController),
          circleButton(context, pageController, currentPageIndex)
        ],
      ));
}
