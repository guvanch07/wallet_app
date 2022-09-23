import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';

class SheetTransactionWidget extends StatelessWidget {
  const SheetTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 27.8, top: 29.2, right: 27.8),
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list,
                    ),
                  )
                ],
              ),
            ),
            //const SizedBox(height: 23.51),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.8),
              child: _ListTile(
                  assetName: AppIcon.whiteMonkey,
                  subTitle: '15 september',
                  title: 'Transfer',
                  money: 3),
            ),

            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff0E0E13),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 27.8, right: 27.8, top: 8),
                child: _ListTile(
                    assetName: AppIcon.yellowMonkey,
                    subTitle: '4 march',
                    title: 'Invited',
                    money: 3),
              ),
            ),
          ],
        ));
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.assetName,
    required this.money,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String assetName;
  final double money;

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
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      title: Text(title, style: TextStyles.headline2),
      subtitle: Text(subTitle, style: TextStyles.subText1),
      leading: CircleAvatar(radius: 27, backgroundImage: AssetImage(assetName)),
    );
  }
}
