// required package imports
import 'package:floor/floor.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/data/data_sources/local/character_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local_data_source.g.dart';

@Database(version: 1, entities: [Character])
abstract class AppDatabase extends FloorDatabase {
  CharactersDao get charactersDao;
}
