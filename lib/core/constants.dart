import 'package:graphql/client.dart';

class Constants {
  static const baseURL = 'https://rickandmortyapi.com/graphql/';
  static const placeholderUrl = 'assets/images/placeholder.jpeg';
  static const humanSpecie = "Human";
  static const alienSpecie = "Alien";
  static const maleGender = "Male";
  static const femaleGender = "Female";
  static const aliveStatus = "Alive";
  static const deadStatus = "Dead";

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
