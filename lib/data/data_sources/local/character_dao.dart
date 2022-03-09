import 'package:floor/floor.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

@dao
abstract class CharactersDao {

  @insert
  Future<void> insertCharacters(List<Character> games);

  @Query('SELECT * FROM Character WHERE page = :page')
  Future<List<Character>> getCharacters(int page);

}