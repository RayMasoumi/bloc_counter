part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

// * we want the initial state to be loading because we don't know the connection status until the first emit, so we want it to be in loading state :
//#initial state:
class InternetLoading extends InternetState {}

// * other than the initial state we have 2 main states >> connected-notConnected
//#connected state:
class InternetConnected extends InternetState {
  // * the connected state may be through wifi or data so we need a ConnectionType property:
  late final ConnectionType connectionType;

  //# constructors must have a connectionType:
  InternetConnected({required this.connectionType});
}

//#not-connected state:
class InternetDisconnected extends InternetState {}
