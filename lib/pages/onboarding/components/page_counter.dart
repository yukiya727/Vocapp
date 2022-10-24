import 'package:flutter/material.dart';

class PageCounter with ChangeNotifier {
  int page_count = 0;

  int get currentPage => page_count;

  setCurrentPage(int val) {
    page_count = val;
    notifyListeners();
  }

  void nextPage() {
    page_count++;
    notifyListeners();
  }

  void previousPage() {
    if (page_count > 0) {
      page_count--;
      notifyListeners();
    }
  }
}
