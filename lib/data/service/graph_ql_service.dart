import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientService {
  late GraphQLClient _qlClient;

  GraphQLClientService() {
    HttpLink link = HttpLink('https://xn--k1aahcehedi.xn--90ais/graphql');
    _qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
  }
  GraphQLClient get qlClient => _qlClient;
}
