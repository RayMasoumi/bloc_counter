import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/home_screen.dart';
import 'package:bloc_counter/presentation/screens/second_screen.dart';
import 'package:bloc_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// * make a private cubit to be accessible in this class only, so that we can send the same counter to each context(screen) in routes through 'BlocProvider.value':
  final CounterCubit _counterCubit = CounterCubit();

//! the BlocProvider.vale widget doesn't close the cubit!!!
  // * we want the cubit to close after this screen is disposed, so:
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
                title: 'Home Screen', color: Colors.blueAccent)),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
                title: 'Second Screen', color: Colors.redAccent)),
        '/third': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
                title: 'Third Screen', color: Colors.greenAccent)),
      },
// *since we're using the 'named routing' we don't need the home property anymore:
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: const HomeScreen(
      //     title: 'Flutter Demo Home Page',
      //     color: Colors.blueAccent,
      //   ),
      // ),
    );
  }
}
