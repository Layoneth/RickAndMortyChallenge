import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/domain/use_cases/get_characters.dart';

part 'get_character_state.dart';

class GetCharacterCubit extends Cubit<GetCharacterState> {
  final GetCharactersUserCase getCharactersUserCase;
  List<Character> charsSaved = [];
  int page = 1;
  GetCharacterCubit(this.getCharactersUserCase) : super(GetCharacterInitial());

  Future<void> getCharacters({bool scroll = false}) async {
    try {
      emit(GetCharacterLoading());
      final newList = await getCharactersUserCase.getCharacters(page: page);
      if (newList.isNotEmpty) {
        charsSaved.addAll(newList);
      }
      if (scroll || page == 1 || charsSaved.isNotEmpty) page++;
      emit(GetCharacterLoaded(characters: charsSaved));
    } catch (e) {
      emit(GetCharacterError(e.toString()));
    }
  }
}
