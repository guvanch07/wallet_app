import 'package:flutter/cupertino.dart';

const int kMockupHeight = 844;
const int kMockupWidth = 390;

abstract class Ratio {
  static double getWidthRatio(BuildContext context) =>
      MediaQuery.of(context).size.width / kMockupWidth;

  static double getHeightRatio(BuildContext context) =>
      MediaQuery.of(context).size.height / kMockupHeight;
}
