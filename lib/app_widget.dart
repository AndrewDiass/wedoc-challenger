import 'common/theme/app_theme.dart';

import 'repositories/repositories.dart';

import 'repositories/home_video_repository.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'modules/home_page/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'modules/root_screen/bloc/root_screen_bloc.dart';
import 'modules/root_screen/root_pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          // Provider(create: (_) => Dio()),
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(
              // HomeVideoRepository: HomeVideoRepository(),
              homeVideoRepository: HomeVideoRepository(dio: Dio()),
              favoriteVideoRepository: FavoriteVideoRepository(dio: Dio()),
            )..add(AppStartedEvent()),
          ),
          BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
        ],
        child: AppScreen(),
      ),
    );
  }
}
