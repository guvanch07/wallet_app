import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/data/audio_test.dart';
import 'package:wallet_app/data/hive_data_model.dart';
import 'package:wallet_app/data/text_object.dart';
import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/home.dart';
import 'package:wallet_app/presentation/pages/second_page/bloc/calculate_bloc.dart';

const favoriteValue = 'favoriteAll_games';
void main() async {
  await Hive.initFlutter();
  await initHiveForFlutter();
  Hive.registerAdapter(HiveTestAdapter());
  Hive.registerAdapter(TextObjectAdapter());
  Hive.registerAdapter(AudioTestAdapter());
  //Hive.registerAdapter(SubAudioTestAdapter());
  await Hive.openBox<HiveTest>(favoriteValue);

  runApp(const MyApp());
}

Future<void> initHiveFunction() async {
  // Directory directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculateBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        home: const AppHome(),
      ),
    );
  }
}
