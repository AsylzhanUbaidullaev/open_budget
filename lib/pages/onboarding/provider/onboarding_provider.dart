import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/pages/login/ui/login.dart';

class OnboardingProvider extends BaseBloc {
  int _pageNumber = 0;
  int get getPageNumber => _pageNumber;
  PageController pageController = PageController(initialPage: 0);

  nextPage() {
    _pageNumber += 1;
    pageController.animateToPage(
      _pageNumber,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  previousPage() {
    _pageNumber -= 1;
    pageController.animateToPage(
      _pageNumber,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
    notifyListeners();
  }

  setPageNumber(int value) {
    _pageNumber = value;
    notifyListeners();
  }

  toLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
        (route) => false);
  }
}
