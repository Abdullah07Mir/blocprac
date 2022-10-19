
part of 'switch_bloc_bloc.dart';

class SwitchBlocState extends Equatable {
  final bool switchValue;
  const SwitchBlocState({required this.switchValue});
  
  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'switchValue': switchValue});
  
    return result;
  }

  factory SwitchBlocState.fromMap(Map<String, dynamic> map) {
    return SwitchBlocState(
      switchValue: map['switchValue'] ?? false,
    );
  }

}

class SwitchBlocInitial extends SwitchBlocState {
  SwitchBlocInitial({required super.switchValue});
}
