import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_archetecture/repository/auth_repository.dart';
import 'package:flutter_mvvm_archetecture/utils/app_utils.dart';
import 'package:flutter_mvvm_archetecture/view_model/base_view_model.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    // _authRepo.loginApi(data).then((value) => null).onError((error, stackTrace) => null)
    _authRepo.loginApi(data).then((value) {
      setLoading(false);
      AppUtils.snackBar("Login Successfuly", context);
      Navigator.pushNamed(context, RouteNames.homeRoute);
    }).onError((error, stackTrace) {
      setLoading(false);
      AppUtils.flushBar("Error", error.toString(), context);
    });
  }
}
