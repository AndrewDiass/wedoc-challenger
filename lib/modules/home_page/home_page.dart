import '../../common/theme/app_theme.dart';

import '../../common/models/video_model.dart';
import '../../common/widgets/video_item/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetVideosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: EdgeInsets.all(AppTheme.sizes.spacing16px),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is HomeErrorState) {
              return Center(
                child: Text(state.messageError),
              );
            }

            state = state as HomeSuccessState;

            var videoList = state.listVideos;

            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.listVideos.length,
                itemBuilder: (BuildContext context, int index) {
                  return VideoItem(
                    video: videoList[index],
                    onFavorite: () =>
                        context.read<HomeBloc>().add(FavoritedVideoEvent(videoId: videoList[index].videoId)),
                  );
                });
          },
        ),
      ),
    );
  }
}
