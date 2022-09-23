// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wallet_app/domain/models/nft_model.dart';
import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/styles/text_styles.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:wallet_app/presentation/widgets/glowaction_button.dart';

const _divider = Divider(
    indent: 180,
    endIndent: 180,
    height: 20,
    color: Colors.white30,
    thickness: 2);

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
              _AppScreen(),
              SizedBox(height: 31.78),
              _CardInfo(),
              SizedBox(height: 42),
              _ScrollListWidget(),
              SizedBox(height: 26),
              _divider,
              SizedBox(height: 10),
              _SheetTransactionWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

class _SheetTransactionWidget extends StatelessWidget {
  const _SheetTransactionWidget({Key? key}) : super(key: key);

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
                      onPressed: () {}, icon: const Icon(Icons.filter_list))
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
                color: AppColors.mainbgc,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 27.8, right: 27.8),
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
      leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(assetName)),
    );
  }
}

class _ScrollListWidget extends StatelessWidget {
  const _ScrollListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Frequent Transactions', style: TextStyles.headline3),
          const SizedBox(height: 21),
          SizedBox(
            height: 90,
            child: Row(
              children: [
                Column(
                  children: [
                    GlowingActionButton(
                      assetName: AppIcon.send,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 13),
                    const Text('Send', style: TextStyles.buttonText),
                  ],
                ),
                const SizedBox(width: 24),
                const VerticalDivider(
                    color: Colors.grey, endIndent: 45, indent: 10),
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
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage(nftDataModel[index].iconPath)),
                              const SizedBox(height: 13),
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

class _CardInfo extends StatelessWidget {
  const _CardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Container(
            height: 136,
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
                      padding: const EdgeInsets.only(left: 15, top: 26),
                      child: Text(
                        "Balance (\$VVS)",
                        style: TextStyles.gradientText,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      child: Text("0.32213", style: TextStyles.monoska),
                    ),
                  ],
                ),
                SvgPicture.asset(AppIcon.ellips)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
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

class _AppScreen extends StatelessWidget {
  const _AppScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 64),
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
              const Text('You earned \$892.20 for this month',
                  style: TextStyles.subText2),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 15, bottom: 12, left: 18, right: 18),
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
          )
        ],
      ),
    );
  }
}
