import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archetecture/utils/routes/routes.dart';
import 'package:flutter_mvvm_archetecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_archetecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthViewModel())],
      child: MaterialApp(
        title: 'Flutter MVVM Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteNames.loginRoute,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
