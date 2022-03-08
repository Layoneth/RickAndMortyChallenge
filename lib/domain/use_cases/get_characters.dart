import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/domain/repositories/character_repo.dart';

class GetCharactersUserCase {
  final CharacterRepository characterRepository;
  GetCharactersUserCase(this.characterRepository);

  Future<List<Character>> getCharacters() async {
    try {
      final character = await characterRepository.getCharacters();
      return character;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
