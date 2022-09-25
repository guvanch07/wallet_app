// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Container(
            height: height * 134,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: height * 26),
                      child: Text(
                        "Balance (\$VVS)",
                        style: TextStyles.gradientText,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: height * 15),
                      child: const Text("0.32213", style: TextStyles.monoska),
                    ),
                  ],
                ),
                SizedBox(width: 187, child: SvgPicture.asset(AppIcon.ellips))
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: height * 16, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: AppColors.colorGradientSilver),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("In dollars",
                    style: TextStyles.subText1
                        .copyWith(color: Colors.black54, fontSize: 11)),
                Text(
                  "\$281.3",
                  style: TextStyles.headline3
                      .copyWith(color: Colors.black54, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
