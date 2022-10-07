import 'package:wallet_app/data/core/query.dart';
import 'package:wallet_app/data/service/graph_ql_service.dart';
import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';
import 'package:wallet_app/domain/repository/repository.dart';
import 'dart:async';
import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

class DataReposity implements IDataReposity {
  final GraphQLClientService _service;

  DataReposity(this._service);

  @override
  Stream<List<MapMarker>> getGraphSql() async* {
    QueryResult queryResult =
        await _service.qlClient.query(QueryOptions(document: gql(query)));

    final list = queryResult.data?['map_markers'] as List;

    final mapper = list.map((e) => MapMarker.fromMap(e)).toList();

    log(mapper.toString());
    log(queryResult.exception.toString());

    yield mapper;
  }
}
