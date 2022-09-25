// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wallet_app/domain/models/nft_model.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:wallet_app/presentation/widgets/glowaction_button.dart';

class ScrollListWidget extends StatelessWidget {
  const ScrollListWidget({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Frequent Transactions', style: TextStyles.headline3),
          SizedBox(height: height * 21),
          SizedBox(
            height: height * 90,
            child: Row(
              children: [
                Column(
                  children: [
                    GlowingActionButton(
                      size: height * 54,
                      assetName: AppIcon.send,
                      onPressed: () {},
                    ),
                    SizedBox(height: height * 13),
                    const Text('Send', style: TextStyles.buttonText),
                  ],
                ),
                SizedBox(width: height * 24),
                const VerticalDivider(
                    color: AppColors.divider, endIndent: 45, indent: 10),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 14), //14 + 12 = 26
                      scrollDirection: Axis.horizontal,
                      itemCount: nftDataModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  radius: height * 28,
                                  backgroundImage:
                                      AssetImage(nftDataModel[index].iconPath)),
                              SizedBox(height: height * 13),
                              Text(nftDataModel[index].name,
                                  style: TextStyles.buttonText
                                      .copyWith(color: Colors.white30))
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
