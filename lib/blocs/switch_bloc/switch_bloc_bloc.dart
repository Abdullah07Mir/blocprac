import '../block_export.dart';
import 'package:bloc_task_fluuter/blocs/block_export.dart';
import 'package:equatable/equatable.dart';

part 'switch_bloc_event.dart';
part 'switch_bloc_state.dart';

class SwitchBlocBloc extends HydratedBloc<SwitchBlocEvent, SwitchBlocState> {
  SwitchBlocBloc() : super(SwitchBlocInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      // TODO: implement event handler
      emit(SwitchBlocState(switchValue: true),);
    });
    on<SwitchOffEvent>((event, emit) {
      // TODO: implement event handler
      emit(SwitchBlocState(switchValue: false),);
    });
    
  }
  
  @override
  SwitchBlocState? fromJson(Map<String, dynamic> json) {
    return SwitchBlocState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(SwitchBlocState state) {
    return state.toMap();
  }
}
