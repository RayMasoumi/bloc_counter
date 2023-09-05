import 'dart:async';

import 'package:bloc_counter/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //# we want internetCubit and CounterCubit to communicate so we inject a dependency:
  InternetCubit internetCubit;
  //# every cubit/bloc has a stream that can be subscribed to:
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(
            // * this is the initial state of the counter so it must be a state which can be imported from the counterState class
            const CounterState(counterValue: 0, isIncremented: true)) {
    //# we subscribe to internetCubit stream and listen to it:
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        decrement();
      }
    });
  }

  // * functions:
  void increment() => emit(
        CounterState(
            counterValue: state.counterValue + 1,
            isIncremented:
                true), // * to get the current state of a cubit we can use state. keyword
      );
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));

  //# canceling subscription:
  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
