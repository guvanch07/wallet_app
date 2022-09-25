import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
            20,
            (index) => ListTile(
                  title: Text('$index'),
                )));
  }
}
