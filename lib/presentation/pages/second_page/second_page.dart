import 'package:flutter/material.dart';

import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/ratio.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/app_screen.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/card_info.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/scroll_list_widget.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/sheet_transaction_widget.dart';

// const _divider = Divider(
//     indent: 185,
//     endIndent: 185,
//     height: 20,
//     color: AppColors.divider,
//     thickness: 3);

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Ratio.getHeightRatio(context);
    //final width = Ratio.getWidthRatio(context);
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 270,
            height: 270,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.red,
            ),
          ),
        ),
        GlassMorphismHollScr(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              AppScreen(height: height),
              SizedBox(height: height * 28), //31
              CardInfo(height: height),
              SizedBox(height: height * 35), //42
              ScrollListWidget(height: height),
              SizedBox(height: height * 18), //26
              SheetTransactionWidget(height: height),
            ],
          ),
        ),
      ],
    );
  }
}
