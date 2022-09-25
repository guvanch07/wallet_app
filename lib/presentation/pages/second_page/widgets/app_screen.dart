import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:wallet_app/presentation/pages/second_page/buy_vvs_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 22, top: height * 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'HeIIo',
                        style: TextStyles.headline1
                            .copyWith(fontWeight: FontWeight.w400)),
                    const TextSpan(
                        text: ' Bradly', style: TextStyles.headline1),
                  ],
                ),
              ),
              const SizedBox(height: 4.7),
              const Text('You earned \$892.20 for this month',
                  style: TextStyles.subText2),
            ],
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BuyVVSScreen(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 12, left: 18, right: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: AppColors.colorGradientBlue,
              ),
              child: Row(
                children: [
                  const Text("\$VVS", style: TextStyles.buttonText),
                  const SizedBox(width: 14),
                  SvgPicture.asset(AppIcon.exchange),
                  const SizedBox(width: 14),
                  const Text("\$", style: TextStyles.buttonText)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
