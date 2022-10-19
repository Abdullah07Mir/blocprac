part of 'switch_bloc_bloc.dart';

abstract class SwitchBlocEvent extends Equatable {
  const SwitchBlocEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchBlocEvent{}
class SwitchOffEvent extends SwitchBlocEvent{}
