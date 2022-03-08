import 'package:floor/floor.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

@dao
abstract class CharactersDao {

  @insert
  Future<void> insertCharacters(List<Character> games);

  @Query('SELECT * FROM Character')
  Future<List<Character>> getCharacters();

}