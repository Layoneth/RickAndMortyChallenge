import 'package:rick_morty_challenge/data/data_sources/remote_data_source.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/domain/repositories/character_repo.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource characterRemoteDataSource;
  // final CharacterLocalDataSource characterRemoteDataSource;

  CharacterRepositoryImpl(this.characterRemoteDataSource);

  @override
  Future<List<Character>> getCharacters() async {
    try {
      final characts = characterRemoteDataSource.getCharacters();

      return characts;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
