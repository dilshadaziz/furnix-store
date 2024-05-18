// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:clean_architecture/features/auth/presentation/pages/login_screen.dart';
import 'package:clean_architecture/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:clean_architecture/features/on_boarding/presentation/bloc/on_boarding_controller_bloc.dart';
import 'package:clean_architecture/features/on_boarding/presentation/pages/on_boarding_1.dart';
import 'package:clean_architecture/utils/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  // Todo: Add Widgets Binding
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(routes: [
      GoRoute(
        name: Go.onbaording,
        path: "/",
        builder: (context, state) => const OnBoarding1(),
        routes: [
          GoRoute(
        name: Go.passwordLogin,
        path: "passwordLogin",
        builder: (context, state) =>
            LoginScreen(),
      ),
      GoRoute(
        name: Go.signUp,
        path: "signUp",
        builder: (context, state) =>
            SignUpScreen(),
      )
        ]
      ),
      

      // This is how we can pass arguments
      // GoRoute(
      //   name: Go.passwordLogin,
      //   path: "/passwordLogin",
      //   builder: (context, state) =>
      //       LoginScreen(name: state.pathParameters["name"]!),
      // )
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
