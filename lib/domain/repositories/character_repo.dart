import 'package:rick_morty_challenge/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}
