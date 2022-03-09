part of 'get_character_cubit.dart';

abstract class GetCharacterState extends Equatable {
  const GetCharacterState();

  @override
  List<Object> get props => [];
}

class GetCharacterInitial extends GetCharacterState {}

class GetCharacterLoading extends GetCharacterState {}

class GetCharacterLoaded extends GetCharacterState {
  final List<Character> characters;

  const GetCharacterLoaded({required this.characters});
}

class GetCharacterError extends GetCharacterState {
  final String error;
  const GetCharacterError(this.error);
}
