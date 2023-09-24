import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../screen/screen.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);
  final PageController pageController = PageController(initialPage: 0);

  int activeScreen = 0;

  List<Widget> screen = [
    const WelcomeScreen(),
    const LoginScreen(),
    const RegisterScreen(),
  ];

  void setScreen({required int newScreen}) {
    activeScreen = newScreen;
    emit(activeScreen);
  }

  void jumpTo({required int index}) {
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
    activeScreen = index;
    emit(index);
  }
}
