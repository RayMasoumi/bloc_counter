import 'package:bloc_counter/constants/enums.dart';
import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<InternetCubit, InternetState>(
        // //# wrapping the whole page with a BlocListener instead of creating streams
        // listener: (context, state) {
        //   if (state is InternetConnected &&
        //       state.connectionType == ConnectionType.wifi) {
        //     BlocProvider.of<CounterCubit>(context).increment();
        //   } else if (state is InternetConnected &&
        //       state.connectionType == ConnectionType.mobile) {
        //     BlocProvider.of<CounterCubit>(context).decrement();
        //   }
        // },
        // child:
        Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              print('internet state: $state');
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return const Text(
                  'Wi-Fi',
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return const Text(
                  'Mobile',
                );
              } else if (state is InternetDisconnected) {
                return const Text(
                  'Disconnected',
                );
              }
              return const CircularProgressIndicator();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.isIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            MaterialButton(
              onPressed: () {
                // * navigate by named routes/generated routes:
                Navigator.pushNamed(context, '/second');
                // * navigate using anonymous routes:
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SecondScreen(
                //         title: 'second screen', color: Colors.redAccent),
                //   ),
                // );
              },
              color: Colors.redAccent,
              child: const Text('move to the second screen'),
            ),
            MaterialButton(
              onPressed: () {
                // * navigate by named routes/generated routes:
                Navigator.pushNamed(context, '/third');
                // * navigate using anonymous routes:
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SecondScreen(
                //         title: 'third screen', color: Colors.greenAccent),
                //   ),
                // );
              },
              color: Colors.greenAccent,
              child: const Text('move to the third screen'),
            ),
          ],
        ),
        //     )
      ),
    );
  }
}
