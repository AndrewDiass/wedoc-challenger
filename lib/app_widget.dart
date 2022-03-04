import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'modules/home_page/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home_page/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider(create: (_) => Dio()),
        BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        title: "Challenger WeDoc",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
