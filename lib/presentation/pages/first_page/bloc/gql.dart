import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';
import 'package:wallet_app/domain/usecase/get_data_usecase.dart';
import 'package:wallet_app/presentation/pages/first_page/first_page.dart';

class GetAllDataBloc extends ChangeNotifier {
  final GetAllDataUseCase _getAllDataUseCase;

  GetAllDataBloc(
    this._getAllDataUseCase,
  );
  Stream<List<MapMarker>> get getAllData => _getAllDataUseCase();

  Completer<GoogleMapController> get controller => _controller;

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> maker(BuildContext context, List<MapMarker>? data) {
    if (data == null) return {};
    Set<Marker> markers = {};
    for (var i = 0; i < data.length; i++) {
      for (var k = 0; k < data[i].suppliers.length; k++) {
        final marker = Marker(
          onTap: () => showDialog(
              context: context,
              builder: (context) => DialogWidget(
                    name: '${data[i].suppliers[k].name}',
                  )),
          markerId: MarkerId('$i'),
          //infoWindow: InfoWindow(title: data[i].lat.toString()),
          position: LatLng(data[i].lat ?? 0, data[i].lng ?? 0),
        );
        markers.add(marker);
      }
    }

    return markers;
  }

  void currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData? currentLocation;
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(
            currentLocation?.latitude ?? 0, currentLocation?.longitude ?? 0),
        zoom: 17.0,
      ),
    ));
  }
}
