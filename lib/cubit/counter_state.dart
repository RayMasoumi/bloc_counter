part of 'counter_cubit.dart';

// * a class that contains the state of the counter >> the blueprint of each state of the counter
class CounterState {
  int counterValue;
  bool isIncremented;
// * constructor:
  CounterState(
      {
      // * the state  of the counter must have a valid value at all time so it needs to be a required parameter:
      required this.counterValue,
      required this.isIncremented});
}
