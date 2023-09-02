import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          // * this is the initial state of the counter so it must be a state which can be imported from the counterState class
          CounterState(counterValue: 0, isIncremented: true),
        );

  // * functions:
  void increment() => emit(
        CounterState(
            counterValue: state.counterValue + 1,
            isIncremented:
                true), // * to get the current state of a cubit we can use state. keyword
      );
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: false));
}
