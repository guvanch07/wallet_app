// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';

class SheetTransactionWidget extends StatelessWidget {
  const SheetTransactionWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            indent: height * 175,
            endIndent: height * 175,
            height: 20,
            color: AppColors.divider,
            thickness: 3,
          ),
          SizedBox(height: height * 8), //9.68
          DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 27.8, top: height * 25, right: 27.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TRANSACTION HISTORY',
                          style: TextStyles.headline3.copyWith(
                            letterSpacing: 0.33,
                            fontSize: 13.19,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 4.22), //4.22 + 17.8 = 32.02
                          child: Icon(
                            Icons.filter_list,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 13), // 5 + padding ListTile = 23.51
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27.8),
                    child: _ListTile(
                        height: height,
                        assetName: AppIcon.whiteMonkey,
                        subTitle: '15 september',
                        title: 'Transfer',
                        money: 3),
                  ),
                  SizedBox(height: height * 3),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color(0xff0E0E13),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 27.8, right: 27.8, top: height * 8),
                      child: Column(
                        children: [
                          _ListTile(
                              height: height,
                              assetName: AppIcon.yellowMonkey,
                              subTitle: '4 march',
                              title: 'Invited',
                              money: 1),
                          const SizedBox(height: 500),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.assetName,
    required this.money,
    required this.height,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String assetName;
  final int money;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '+ $money ', style: TextStyles.headline2),
            const TextSpan(text: ' \$VVS', style: TextStyles.body1),
          ],
        ),
      ),
      //dense: true,
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      title: Text(title, style: TextStyles.headline2),
      subtitle: Text(subTitle, style: TextStyles.subText1),
      leading: CircleAvatar(
          radius: height * 26, backgroundImage: AssetImage(assetName)),
    );
  }
}
