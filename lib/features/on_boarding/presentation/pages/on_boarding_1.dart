
import 'package:clean_architecture/features/on_boarding/presentation/bloc/on_boarding_controller_bloc.dart';
import 'package:clean_architecture/features/on_boarding/presentation/widgets/bottom_buttons.dart';
import 'package:clean_architecture/features/on_boarding/presentation/widgets/oval_image.dart';
import 'package:clean_architecture/features/on_boarding/presentation/widgets/texts.dart';
import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    int currentPageIndex = 0;
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
        return Stack(
          children: [
            // Horizontal Scrollable Pages

            PageView.builder(
              onPageChanged: (value) {
                currentPageIndex = value;
                if (value > currentPageIndex) {
                  BlocProvider.of<OnboardingBloc>(context).add(
                      OnboardingNextButtonPressed(
                          currentPage: currentPageIndex));
                } else {
                  BlocProvider.of<OnboardingBloc>(context).add(
                      OnboardingPreviousButtonPressed(
                          currentPage: currentPageIndex));
                }
              },
              
              // physics: const scrool(),
              allowImplicitScrolling: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                currentPageIndex = index;
                return OnBoardingScreens(
                  index: currentPageIndex,
                );
              },
              controller: pageController,
            ),
            // Skip Button
            // Circular Buttons and Page Indicator
            bottomButtons(context, pageController, currentPageIndex)
          ],
        );
      }),
    );
  }
}

class OnBoardingScreens extends StatelessWidget {
  final int index;
  const OnBoardingScreens({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ovalImage(context, index),
        SizedBox(
          height: getHeight(context) * 0.02,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    titleText(context, index),
                    const SizedBox(height: 5),
                    subtitleText(context, index),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
