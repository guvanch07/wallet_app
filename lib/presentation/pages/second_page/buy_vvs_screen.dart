import 'package:flutter/material.dart';
import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:flutter/services.dart';

import 'package:wallet_app/presentation/widgets/slider_button.dart';

class BuyVVSScreen extends StatelessWidget {
  const BuyVVSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondbgc.withOpacity(0.9),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(
            AppIcon.arrowBack,
            width: 27.63,
            height: 7.62,
          ),
        ),
        title: Text(
          'Buy \$VVS',
          style: TextStyles.headline2.copyWith(fontSize: 18, letterSpacing: 0),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
          GlassMorphismHollScr(
            child: Column(
              children: [
                const SizedBox(height: 48),
                const CartDetailWidget(),
                const SizedBox(height: 35),
                const MoneydisplayWidget(),
                const SizedBox(height: 69.99),
                const NumberTableWidget(),
                const Spacer(),
                AnimatedSwipeToConfirm(
                  onCancel: () {},
                  onConfirm: () {},
                ),
                const SizedBox(height: 46)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartDetailWidget extends StatelessWidget {
  const CartDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment method',
            style: TextStyles.body1
                .copyWith(color: const Color(0xff9D9898), fontSize: 14),
          ),
          const SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 312 / 60,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: AppColors.card,
              ),
              child: ListTile(
                title: Text(
                  '8600 **** **** 1234',
                  style: TextStyles.subText3.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white30,
                  ),
                ),
                subtitle: Text(
                  '06/24',
                  style: TextStyles.headline2.copyWith(fontSize: 11.3),
                ),
                leading: Image.asset(AppIcon.cardIcon, width: 40, height: 30),
                trailing: const Text('change', style: TextStyles.subText3),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MoneydisplayWidget extends StatelessWidget {
  const MoneydisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '0',
                  style: TextStyles.buttonText.copyWith(fontSize: 64.49)),
              TextSpan(
                text: '\$vvs',
                style: TextStyles.buttonText.copyWith(fontSize: 32.24),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.63),
        Text(
          '0 USD',
          style: TextStyles.buttonText.copyWith(
            fontSize: 25.79,
            color: const Color(0xffBBBBBB),
          ),
        ),
      ],
    );
  }
}

class NumberTableWidget extends StatelessWidget {
  const NumberTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '1',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '2',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '3',
                    style: TextStyles.numbers,
                  ),
                ),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 13),
              SizedBox(height: 13),
              SizedBox(height: 13),
            ]),
            TableRow(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '4',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '5',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '6',
                    style: TextStyles.numbers,
                  ),
                ),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 13),
              SizedBox(height: 13),
              SizedBox(height: 13),
            ]),
            TableRow(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '7',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '8',
                    style: TextStyles.numbers,
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                  },
                  icon: const Text(
                    '9',
                    style: TextStyles.numbers,
                  ),
                ),
              ],
            ),
            const TableRow(children: [
              SizedBox(height: 13), // 8 + 8 + 13 = 29
              SizedBox(height: 13),
              SizedBox(height: 13),
            ]),
            TableRow(children: [
              IconButton(
                // padding 8
                alignment: Alignment.center,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                },
                icon: const Text(
                  '.',
                  style: TextStyles.numbers,
                ),
              ),
              IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                },
                icon: const Text(
                  '0',
                  style: TextStyles.numbers,
                ),
              ),
              IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                },
                icon: const Icon(Icons.close),
              ),
            ]),
          ]),
    );
  }
}
