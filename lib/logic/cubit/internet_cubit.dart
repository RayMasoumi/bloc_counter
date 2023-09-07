import 'dart:async';

import 'package:bloc_counter/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  //# methods to emit different states:
// * connected state:
  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

// * disconnected state
  void emitInternetDisconnected() => emit(InternetDisconnected());

  //# we want the cubit to communicate with Connectivity_plus package
  //# >> to do that we need to subscribe to its stream and listen to it:
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  //# as we see the first emitted state of this cubit is loadingState(the initial state):
  //# also we want to react based on connectivity status so we pass it in as an argument to internetCubit:
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    // * subscribing to the stream and listening to it:
    connectivityStreamSubscription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      // * Got a new connectivity status!
      if (connectivityResult == ConnectivityResult.mobile) {
        print('Mobile');
        // I am connected to a mobile network:
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        print('wifi');
        // I am connected to a wifi network.
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.none) {
        print('disconnected');
        // I am not connected to network.
        emitInternetDisconnected();
      }
    });
  }

  //# Be sure to cancel subscription after you are done
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
