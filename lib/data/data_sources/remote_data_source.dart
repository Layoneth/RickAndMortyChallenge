import 'package:graphql/client.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<Character>> getCharacters({required int page});
}

class CharacterRemoteDataSourceImp implements CharacterRemoteDataSource {
  CharacterRemoteDataSourceImp();

  @override
  Future<List<Character>> getCharacters({required int page}) async {
    try {

      final QueryOptions options = QueryOptions(
        document: gql(
          '''
            query GetCharacters {
              characters(page: $page) {
                info {
                  count
                  pages
                  next
                  prev
                }
                results {
                  id
                  name
                  status
                  species
                  type
                  gender
                  image
                  created
                }
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

      final ListCharacters characts =
        ListCharacters.fromJson(qlResponse.data!['characters'], page);

      return characts.results;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
