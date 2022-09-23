import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 189,
            height: 176,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.red,
            ),
          ),
        ),
        GlassMorphismHollScr(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('asasa', style: TextStyles.headline1),
                ],
              ),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
              const Text('asasa', style: TextStyles.headline1),
            ],
          ),
        ),
      ],
    );
  }
}
