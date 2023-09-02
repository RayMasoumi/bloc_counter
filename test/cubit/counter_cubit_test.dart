//#1 we need everything to be tested so we make symmetrical directories in test directory to test every feature

//#2 then we make a main method:
import 'package:bloc_counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //#3 we create a group which is a way to organise a test for multiple features: for example now that we are in counter cubit directory we need to add all the necessary tests for the counter feature here:
  group('CounterCubit', () {
    //#4 then set a setup and teardown function for each test:
    //# setup: is used to instantiate the objects our test will be working with, so we can access it later
    late CounterCubit counterCubit;
    setUp(() {
      //# a function that is called to initiate the necessary data
      counterCubit = CounterCubit();
    });

    //# a function that will be called whenever each test is run >> so we can  close the created cubit in it
    tearDown(() {
      counterCubit.close();
    });

    //#5 running the test:
    test(
        'the initial state of the counterCubit is CounterState(CounterValue : 0)',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, isIncremented: true));
    });
  });
}
