//#1 we need everything to be tested so we make symmetrical directories in test directory to test every feature

//#2 then we make a main method:
import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
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

    //#5 running the test for initial state:
    test(
        'the initial state of the counterCubit is CounterState(CounterValue : 0)',
        () {
      expect(counterCubit.state,
          const CounterState(counterValue: 0, isIncremented: true));
    });

    //# testing increment() and decrement() methods:
    //#>> we're testing the output as a reponse to these functions so we'll use this method:
    // * increment func test
    blocTest(
      'when cubit.increment is called the cubit should emit  a CounterState(counterValue:1, isIncremented: true',
      build: () =>
          counterCubit, //# returns the current instance of counterCubit so we can use it in test
      act: (cubit) => cubit
          .increment(), //# takes a cubit and returns the action that was applied on it
      expect: () => [
        const CounterState(counterValue: 1, isIncremented: true),
      ], //#checks the order to test the result
    );

    // * decrement func test
    blocTest(
      'when cubit.decrement is called the cubit should emit  a CounterState(counterValue:-1, isIncremented: false',
      build: () =>
          counterCubit, //# returns the current instance of counterCubit so we can use it in test
      act: (cubit) => cubit
          .decrement(), //# takes a cubit and returns the action that was applied on it
      expect: () => [
        const CounterState(counterValue: -1, isIncremented: false),
      ], //#checks the order to test the result
    );
  });
}
