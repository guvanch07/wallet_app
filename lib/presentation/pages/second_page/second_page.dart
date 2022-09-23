// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/app_screen.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/card_info.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/scroll_list_widget.dart';
import 'package:wallet_app/presentation/pages/second_page/widgets/sheet_transaction_widget.dart';

const _divider = Divider(
    indent: 185,
    endIndent: 185,
    height: 20,
    color: AppColors.divider,
    thickness: 3);

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: const [
              AppScreen(),
              SizedBox(height: 31.78),
              CardInfo(),
              SizedBox(height: 42),
              ScrollListWidget(),
              SizedBox(height: 26),
              _divider,
              SizedBox(height: 8),
              SheetTransactionWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
