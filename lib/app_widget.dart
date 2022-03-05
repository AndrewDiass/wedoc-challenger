import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'common/constants/constants.dart';
import 'common/network_data/dio_client.dart';
import 'modules/home_page/bloc/home_bloc.dart';
import 'modules/root_screen/bloc/root_screen_bloc.dart';
import 'modules/root_screen/root_pages.dart';
import 'repositories/home_video_repository.dart';
import 'repositories/repositories.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          // Provider(create: (_) => Dio()),
          BlocProvider<RootScreenBloc>(
            create: (context) => RootScreenBloc(
              favoriteVideoRepository: FavoriteVideoRepository(dio: DioClient()),
            )..add(AppStartedEvent()),
          ),
          BlocProvider<HomeBloc>(
              create: (context) =>
                  HomeBloc(homeVideoRepository: HomeVideoRepository(dio: DioClient(baseUrl: BASE_URL)))),
        ],
        child: AppScreen(),
      ),
    );
  }
}
