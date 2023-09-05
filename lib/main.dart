import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

//!!!!!!!!!!A BETTER WAY!!!!!!!!!!!!!!!!!!!!:
//! we can use a single cubit/bloc for a whole app instead of passing its value(using BlocProvider.value) to each screen one by one
//! instead>> we can access it globally:
//# to do that>> we only need to wrap the MaterialApp widget inside a BlocProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute:
          _appRouter.onGenerateRoute, //# we pass the function as an argument
    );
  }
}
