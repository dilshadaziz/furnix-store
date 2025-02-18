
import 'package:clean_architecture/features/auth/presentation/pages/login_screen.dart';
import 'package:clean_architecture/features/on_boarding/presentation/bloc/on_boarding_controller_bloc.dart';
import 'package:clean_architecture/utils/constants/colors.dart';
import 'package:clean_architecture/utils/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Widget circleButton(
    BuildContext context, PageController pageController, int currentPageIndex) {
  return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
    if (
        currentPageIndex == 2) {
      return GestureDetector(
        onTap: (){
          // Single time onboarded and Navigate to login page 
        },
        child: const CircleAvatar(
          radius: 30,
          foregroundColor: Colors.white,
          backgroundColor: FColors.primaryColor,
          child: Center(child: Icon(Icons.start_rounded),),
        ),
      );
    } else {
      return GestureDetector(
        onLongPress: (){
          _saveAndGoToLogin(context);
        },
        onHorizontalDragStart: (details){
          print(details);
        },
        onTap: () {
          pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate);
          BlocProvider.of<OnboardingBloc>(context)
              .add(OnboardingNextButtonPressed(currentPage: currentPageIndex));
        },
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: FColors.primaryColor,
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  });
}

void _saveAndGoToLogin(BuildContext context){
  // Save to sharedPrefs that user already completed the onboarding screen

  // Navigate to Social Media Login
  context.pushReplacementNamed(Go.passwordLogin);
}

Widget circleButtonLeft(
    BuildContext context, PageController pageController, int index) {
  return BlocBuilder<OnboardingBloc, OnboardingState>(
    builder: (context, state) {
      if (state is OnboardingPageChanged && index > 0) {
        return GestureDetector(
          onTap: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate);
            BlocProvider.of<OnboardingBloc>(context)
                .add(OnboardingPreviousButtonPressed(currentPage: index));
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: FColors.primaryColor,
            child: CircleAvatar(
              radius: 29,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: const Center(
                  child: Icon(
                Icons.arrow_back,
                color: FColors.primaryColor,
              )),
            ),
          ),
        );
      } else {
        return const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
        );
      }
    },
  );
}
