import 'package:graphql/client.dart';

class Constants {
  static const baseURL = "https://rickandmortyapi.com/graphql/";
  static const placeholderUrl = "http://via.placeholder.com/288x188";

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
