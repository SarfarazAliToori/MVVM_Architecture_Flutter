import 'package:flutter/cupertino.dart';

class BaseViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }
}
