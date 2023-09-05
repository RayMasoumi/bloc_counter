import 'dart:async';

import 'package:bloc_counter/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  //# we want the cubit to communicate with Connectivity_plus package
  //# >> to do that we need to subscribe to its stream and listen to it:
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  //# as we see the first emitted state of this cubit is loadingState(the initial state):
  //# also we want to react based on connectivity status so we pass it in as an argument to internetCubit:
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    // * subscribing to the stream and listening to it:
    connectivityStreamSubscription = monitorInternetConnection();
  }

  //# Be sure to cancel subscription after you are done
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  //# methods to emit different states:
// * connected state:
  void emitInternetConnected(ConnectionType connectionType) =>
      InternetConnected(connectionType: connectionType);

// * emit disconnected state:
  void emitInternetDisconnected() => InternetDisconnected();
//# monitor method:
  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      // * Got a new connectivity status!
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network:
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.none) {
        // I am not connected to network.
        emitInternetDisconnected();
      }
    });
  }
}
