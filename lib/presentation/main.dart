import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:provider/provider.dart';
import 'package:wallet_app/data/repository_impl/data_repository_impl.dart';
import 'package:wallet_app/data/service/graph_ql_service.dart';
import 'package:wallet_app/domain/usecase/get_data_usecase.dart';

import 'package:wallet_app/presentation/core/theme/theme_colors.dart';
import 'package:wallet_app/presentation/pages/first_page/bloc/gql.dart';
import 'package:wallet_app/presentation/pages/home.dart';
import 'package:wallet_app/presentation/pages/second_page/bloc/calculate_bloc.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalculateBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAllDataBloc(
            /// now without di
            GetAllDataUseCase(
              DataReposity(
                GraphQLClientService(),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        home: const AppHome(),
      ),
    );
  }
}
