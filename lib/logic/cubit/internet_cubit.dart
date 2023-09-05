import 'package:bloc_counter/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  //# as we see the first emitted state of this cubit is loadingState(the initial state):
  InternetCubit() : super(InternetLoading());

//# methods to emit different states:
  // * connected state:
  void emitInternetConnected(ConnectionType connectionType) =>
      {InternetConnected(connectionType: connectionType)};

  // * emit disconnected state:
  void emitDisconnected() => InternetDisconnected();
}
