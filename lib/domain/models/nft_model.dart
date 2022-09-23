// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';

@immutable
class NFTdataModel {
  final String iconPath;
  final String name;
  const NFTdataModel({
    required this.iconPath,
    required this.name,
  });
}

const List<NFTdataModel> nftDataModel = [
  NFTdataModel(iconPath: AppIcon.firstNFT, name: 'Mathey'),
  NFTdataModel(iconPath: AppIcon.seconstNFT, name: 'Bradly'),
  NFTdataModel(iconPath: AppIcon.thirdNFT, name: 'Mathey'),
  NFTdataModel(iconPath: AppIcon.seconstNFT, name: 'Bradly'),
  NFTdataModel(iconPath: AppIcon.firstNFT, name: 'Mathey'),
];
