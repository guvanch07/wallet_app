import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';

/// interface
abstract class IDataReposity {
  Stream<List<MapMarker>> getGraphSql();
}
