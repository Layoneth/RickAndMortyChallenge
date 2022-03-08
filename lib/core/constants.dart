import 'package:graphql/client.dart';

class Constants {
  static const baseURL = "https://rickandmortyapi.com/graphql/";
  static const characterEndpoint = "character";
  static const locationEndpoint = "location";
  static const episodeEndpoint = "episode";

  static GraphQLClient getGraphQLClient({String? param}) {
    final Link _link = HttpLink(
      baseURL + (param ?? ''),
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
