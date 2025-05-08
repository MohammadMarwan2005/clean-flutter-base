import 'package:clean_flutter_base/presentation/feature/test/test_screen.dart';
import 'package:clean_flutter_base/presentation/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.testScreen:
        return MaterialPageRoute(
          builder: (_) => const TestScreen(),
        );
      case Routes.loadingScreen:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      default:
        return null;
    }
  }
}
