import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class MenuController extends ChangeNotifier {
  int page = 0;

  set setPage(index) {
    page = index;
    notifyListeners();
  }

  int get getPage{
    return page;
  }
}
