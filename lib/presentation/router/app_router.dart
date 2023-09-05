// * creating a class for routing in between screens(similar to namedRouting):
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // * the function that takes the name of each screen and returns it:
  Route? onGenerateRoute(RouteSettings routeSettings) {
    // * we access each route by its name, which is provided by 'routeSettings.name'
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'second Screen',
                  color: Colors.redAccent,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'third Screen',
                  color: Colors.greenAccent,
                ));
      default:
        return null;
    }
  }
}
