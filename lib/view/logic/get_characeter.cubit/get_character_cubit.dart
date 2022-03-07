import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/domain/use_cases/get_characters.dart';

part 'get_character_state.dart';

class GetCharacterCubit extends Cubit<GetCharacterState> {
  final GetCharactersUserCase getCharactersUserCase;
  List<Character> charsSaved = [];
  GetCharacterCubit(this.getCharactersUserCase) : super(GetCharacterInitial());

  Future<void> getCharacters() async {
    try {
      emit(GetCharacterLoading());
      charsSaved = [];
      charsSaved = await getCharactersUserCase.getCharacters();
      emit(GetCharacterLoaded(characters: charsSaved));
    } catch (e) {
      emit(GetCharacterError(e.toString()));
    }
  }
}
