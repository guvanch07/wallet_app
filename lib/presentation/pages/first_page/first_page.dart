import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/first_page/bloc/gql.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MapMarker>>(
        stream: context.read<GetAllDataBloc>().getAllData,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator.adaptive();
          }

          return _GoogleMapWidget(data: data);
        });
  }
}

class _GoogleMapWidget extends StatelessWidget {
  const _GoogleMapWidget({Key? key, required this.data}) : super(key: key);

  final List<MapMarker>? data;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(53.84300734638802, 27.477321624755863),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    //final watch = context.watch<GetAllDataBloc>();
    final read = context.read<GetAllDataBloc>();
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GoogleMap(
          myLocationEnabled: true,
          markers: read.maker(context, data),
          initialCameraPosition: _kGooglePlex,
          onMapCreated: read.controller.complete,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(55, 55)),
            onPressed: () => read.currentLocation(),
            shape: const CircleBorder(),
            elevation: 3,
            fillColor: AppColors.accent,
            splashColor: Colors.black,
            child: const Icon(CupertinoIcons.location_circle_fill, size: 26),
          ),
        ),
      ],
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(name),
      actions: [
        CupertinoButton.filled(
          child: const Text("back"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
