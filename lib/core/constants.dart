import 'package:graphql/client.dart';

class Constants {
  static const baseURL = "https://rickandmortyapi.com/api/";
  static const characterEndpoint = "character";
  static const locationEndpoint = "location";
  static const episodeEndpoint = "episode";

  static GraphQLClient getGraphQLClient() {
    final Link _link = HttpLink(
      baseURL,
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
