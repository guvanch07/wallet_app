import 'package:flutter/material.dart';

import 'package:wallet_app/presentation/core/components/classmorphishm.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/first_page.dart';
import 'package:wallet_app/presentation/pages/fourth_page.dart';
import 'package:wallet_app/presentation/pages/second_page.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 50,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 186, 32, 32),
                  ),
                ),
              ],
            ),
            const GlassMorphism(
              margin: 31,
              padding: 0,
              child: TabBar(
                  labelPadding: EdgeInsets.symmetric(vertical: 10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.accent,
                  indicatorWeight: 5,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(icon: Icon(Icons.stacked_bar_chart)),
                    Tab(icon: Icon(Icons.stacked_bar_chart)),
                    Tab(icon: Icon(Icons.stacked_bar_chart)),
                    Tab(icon: Icon(Icons.stacked_bar_chart)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
