import 'package:rick_morty_challenge/data/data_sources/local/local_data_source.dart';
import 'package:rick_morty_challenge/data/data_sources/remote_data_source.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/domain/repositories/character_repo.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource characterRemoteDataSource;
  final AppDatabase appDatabase;

  CharacterRepositoryImpl(
    this.characterRemoteDataSource,
    this.appDatabase
  );

  @override
  Future<List<Character>> getCharacters({required int page}) async {
    try {
      List<Character> characList
        = await appDatabase.charactersDao.getCharacters(page);
      if (characList.isEmpty) {
        characList += await characterRemoteDataSource.getCharacters(page: page);
        appDatabase.charactersDao.insertCharacters(characList);
      }

      return characList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
