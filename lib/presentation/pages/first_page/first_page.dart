import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet_app/data/audio_test.dart';
import 'package:wallet_app/data/hive_data_model.dart';
import 'package:wallet_app/data/text_object.dart';
import 'package:wallet_app/main.dart';
import 'package:wallet_app/presentation/pages/first_page/bloc/gql.dart';

final Box<HiveTest> favoriteAllgamesBox = Hive.box(favoriteValue);

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    getGraphSql();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        20,
        (index) => ValueListenableBuilder(
            valueListenable: favoriteAllgamesBox.listenable(),
            builder: (context, Box<HiveTest> box, _) {
              final data = box.get(index);
              return ListTile(
                onTap: () {
                  HiveTest obj = HiveTest(
                      audioTest: AudioTest(
                        lastname: 'lastname$index',
                      ),
                      id: 'id$index',
                      textObject: TextObject(name: 'name'));
                  favoriteAllgamesBox.put(index, obj);
                },
                subtitle: Text(data?.audioTest?.lastname ?? "empty",
                    style: const TextStyle(color: Colors.amberAccent)),
                title: Text(
                  '$index',
                  style: TextStyle(
                      color: favoriteAllgamesBox.containsKey(index)
                          ? Colors.red
                          : Colors.white),
                ),
              );
            }),
      ),
    );
  }
}
