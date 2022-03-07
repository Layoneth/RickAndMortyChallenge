import 'package:get_it/get_it.dart';
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
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(() => CharacterRemoteDataSourceImp());

  // External
  // sl.registerLazySingleton(() => Dio());
}