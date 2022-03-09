import 'package:get_it/get_it.dart';
import 'package:rick_morty_challenge/data/data_sources/local/local_data_source.dart';
import 'package:rick_morty_challenge/data/data_sources/remote_data_source.dart';
import 'package:rick_morty_challenge/data/repositories/character_repo.dart';
import 'package:rick_morty_challenge/domain/repositories/character_repo.dart';
import 'package:rick_morty_challenge/domain/use_cases/get_characters.dart';
import 'package:rick_morty_challenge/view/logic/get_characeter.cubit/get_character_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  await initCharacters();
}

Future<void> initCharacters() async {
  // Cubit
  sl.registerFactory(() => GetCharacterCubit(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetCharactersUserCase(sl()));

  // Movie Repository
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(sl(), sl()));

  // Data sources
  // Remote
  sl.registerLazySingleton<CharacterRemoteDataSource>(() => CharacterRemoteDataSourceImp());
  // Local
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerLazySingleton<AppDatabase>(() => database);

  // External
  // sl.registerLazySingleton(() => Dio());
}