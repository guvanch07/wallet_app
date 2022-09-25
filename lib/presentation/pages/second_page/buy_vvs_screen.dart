// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:wallet_app/presentation/core/utils/ratio.dart';
import 'package:wallet_app/presentation/pages/second_page/bloc/calculate_bloc.dart';
import 'package:wallet_app/presentation/widgets/slider_button.dart';

class BuyVVSScreen extends StatelessWidget {
  const BuyVVSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Ratio.getHeightRatio(context);
    //final width = Ratio.getWidthRatio(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 150),
                Container(
                  width: 110,
                  height: 110,
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
                SizedBox(height: height * 48),
                const CartDetailWidget(),
                SizedBox(height: height * 35),
                MoneydisplayWidget(height: height),
                SizedBox(height: height * 43.99), //69.99 - 32
                const NumberTableWidget(),
                const Spacer(),

                AnimatedSwipeToConfirm(
                  onCancel: () =>
                      context.read<CalculateBloc>().submitButton(false),
                  onConfirm: () =>
                      context.read<CalculateBloc>().submitButton(true),
                ),
                SizedBox(height: height * 36),
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
          Container(
            padding: const EdgeInsets.only(left: 15, right: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: AppColors.card,
            ),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
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
          )
        ],
      ),
    );
  }
}

class MoneydisplayWidget extends StatelessWidget {
  const MoneydisplayWidget({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              if (context.watch<CalculateBloc>().displayNumbers.isEmpty)
                TextSpan(
                  text: '0',
                  style: TextStyles.buttonText.copyWith(
                    fontSize: 64.49,
                    color: const Color(0xff727272),
                  ),
                )
              else if (context.watch<CalculateBloc>().sum > 0)
                TextSpan(
                  text: '${context.watch<CalculateBloc>().sum}',
                  style: TextStyles.buttonText.copyWith(
                    fontSize: 64.49,
                  ),
                )
              else
                ...context.watch<CalculateBloc>().displayNumbers.map(
                      (e) => TextSpan(
                        text: '$e',
                        style: TextStyles.buttonText.copyWith(
                            fontSize: context
                                        .watch<CalculateBloc>()
                                        .displayNumbers
                                        .length >
                                    8
                                ? 30
                                : 64.49),
                      ),
                    ),
              TextSpan(
                text: ' \$vvs',
                style: TextStyles.buttonText.copyWith(fontSize: 32.24),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 30.63),
        Text(
          '${context.watch<CalculateBloc>().subNumber} USD',
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
                    context.read<CalculateBloc>().addNumbers(1);
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
                    context.read<CalculateBloc>().addNumbers(2);
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
                    context.read<CalculateBloc>().addNumbers(3);
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
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10),
            ]),
            TableRow(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    context.read<CalculateBloc>().addNumbers(4);
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
                    context.read<CalculateBloc>().addNumbers(5);
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
                    context.read<CalculateBloc>().addNumbers(6);
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
              SizedBox(height: 10),
              SizedBox(height: 10),
              SizedBox(height: 10),
            ]),
            TableRow(
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    context.read<CalculateBloc>().addNumbers(7);
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
                    context.read<CalculateBloc>().addNumbers(8);
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
                    context.read<CalculateBloc>().addNumbers(9);
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
              SizedBox(height: 10), // 9 + 9 + 13 = 29
              SizedBox(height: 10),
              SizedBox(height: 10),
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
                  context.read<CalculateBloc>().removeNumbers();
                  HapticFeedback.heavyImpact();
                },
                icon: SvgPicture.asset(AppIcon.close),
              ),
            ]),
          ]),
    );
  }
}
