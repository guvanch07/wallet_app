import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';
import 'package:wallet_app/domain/repository/repository.dart';
import 'package:wallet_app/domain/usecase/base_usecase.dart';

class GetAllDataUseCase extends UseCase<Stream<List<MapMarker>>> {
  final IDataReposity _reposity;

  GetAllDataUseCase(this._reposity);
  @override
  Stream<List<MapMarker>> call() {
    return _reposity.getGraphSql();
  }

  @override
  void dispose() {}
}
