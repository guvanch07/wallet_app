import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';

const query = """
{
  map_markers(general:
  {language: "by",city: "minsk",country: "by",subscription: "platinum",
  activity:[],tag:[]},
  leftTopPoint:{lat:53.93051341740901,lng:27.332954406738285},
  centerPoint:{lat: 53.84300734638802,lng: 27.477321624755863}) {
    lat
    lng
    suppliers {
        id
        name
    }
  }
}
""";

Future<void> getGraphSql() async {
  HttpLink link = HttpLink('https://xn--k1aahcehedi.xn--90ais/graphql');

  GraphQLClient qlClient = GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

  QueryResult queryResult =
      await qlClient.query(QueryOptions(document: gql(query)));

  final list = queryResult.data?['map_markers'] as List;

  final mapper = list.map((e) {
    log(e.toString());
    return MapMarker.fromMap(e as Map<String, dynamic>);
  }).toList();

  print(mapper);

  //log(queryResult.data?['map_markers'].toString() ?? '');
  //log(data.suppliers.toString());
  print(queryResult.exception);
}
