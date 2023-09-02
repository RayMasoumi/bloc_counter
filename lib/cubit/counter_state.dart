part of 'counter_cubit.dart';

// * a class that contains the state of the counter >> the blueprint of each state of the counter
class CounterState
    extends Equatable //#extended this class so that we can compare class' properties instead of its location (for testing)
{
  final int counterValue;
  final bool isIncremented;
// * constructor:
  const CounterState(
      {
      // * the state  of the counter must have a valid value at all time so it needs to be a required parameter:
      required this.counterValue,
      required this.isIncremented});

  @override
  List<Object?> get props => [
        counterValue,
        isIncremented
      ]; //# determining the properties that must be compared in order to check the functionality for testing >> to see if the 2 instances are the same(actual instance vs what we expect)
}
