import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<Character>> getCharacters();
}

class CharacterRemoteDataSourceImp implements CharacterRemoteDataSource {
  // final Dio dio;
  CharacterRemoteDataSourceImp();

  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      // var response =
      //   await dio.get('${Constants.baseURL}${Constants.characterEndpoint}');

      final QueryOptions options = QueryOptions(
        document: gql(
          '''
            query getCharacters{
              characters(page: $page, ) {
                info {
                  count
                }
                results {
                  id
                  name
                  status
                  species
                  type
                  gender
                  origin
                  location
                  image
                  episodes
                  url
                  created
                }
              }
              location(id: 1) {
                id
              }
              episodesByIds(ids: [1, 2]) {
                id
              }
            }
          ''',
        ),
      );

      var qlResponse = await Constants.getGraphQLClient().query(options);

      if (qlResponse.hasException) {
        print(qlResponse.exception);
        return [];
      }

      final List<Character> characts =
        qlResponse.data!['characters']['results'] as List<Character>;

      return characts;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
