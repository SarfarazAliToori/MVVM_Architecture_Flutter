import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archetecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_archetecture/view/home_screen.dart';
import 'package:flutter_mvvm_archetecture/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RouteNames.homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case RouteNames.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LogInScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("No Route Defined!"),
              ),
            );
          },
        );
    }
  }
}
