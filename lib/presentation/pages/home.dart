import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/core/utils/path_icon.dart';
import 'package:wallet_app/presentation/pages/first_page.dart';
import 'package:wallet_app/presentation/pages/fourth_page.dart';
import 'package:wallet_app/presentation/pages/second_page/second_page.dart';
import 'package:wallet_app/presentation/pages/third_page.dart';

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
          FourthPage(),
        ]),
        bottomNavigationBar: Stack(
          children: [
            const _UnderStack(),
            GlassMorphism(
              margin: 31,
              padding: 0,
              child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(vertical: 10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.indicator,
                  indicatorWeight: 5,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
                  tabs: [
                    Tab(icon: SvgPicture.asset(AppIcon.safari)),
                    Tab(icon: SvgPicture.asset(AppIcon.wallet)),
                    Tab(icon: SvgPicture.asset(AppIcon.msg)),
                    Tab(icon: Image.asset(AppIcon.nft, height: 31, width: 31)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnderStack extends StatelessWidget {
  const _UnderStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 50,
            height: 80,
            child: Column(
              children: [
                const SizedBox(
                  width: 30,
                  height: 50,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50,
            height: 60,
            child: Column(
              children: [
                const SizedBox(
                  width: 30,
                  height: 30,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 135,
            height: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 154, 23, 23),
            ),
          ),
        ],
      ),
    );
  }
}
