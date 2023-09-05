// * creating a class for routing in between screens(similar to namedRouting):
import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  //# provide the same cubit for each screen(to have the same state)
  final CounterCubit _counterCubit = CounterCubit();
  //# and then close it manually at the end

  // * the function that takes the name of each screen and returns it:
  Route? onGenerateRoute(RouteSettings routeSettings) {
    // * we access each route by its name, which is provided by 'routeSettings.name'
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                    title: 'Home Screen',
                    color: Colors.blueAccent,
                  ),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                  title: 'second Screen',
                  color: Colors.redAccent,
                )));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                  title: 'third Screen',
                  color: Colors.greenAccent,
                )));
      default:
        return null;
    }
  }

//# closing the cubit:
  void dispose() {
    _counterCubit.close();
  }
}
