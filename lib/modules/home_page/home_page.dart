import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/storage/favorite_storage.dart';
import '../../common/theme/app_theme.dart';
import '../../common/widgets/Loading/loading_widget.dart';
import '../../common/widgets/empty/empty_videos_widget.dart';
import '../../common/widgets/error/error_message_widget.dart';
import '../../common/widgets/video_item/video_item_widget.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> favoriteIds;

  getFavoriteVideos() {
    favoriteIds = context.watch<FavoriteStorage>().favoriteIds;

    setState(() {});
  }

  setFavoriteLocale(String videoId) {
    context.read<FavoriteStorage>().setFavoriteLocale(videoId);
  }

  removeFavoriteLocale(String videoId) {
    context.read<FavoriteStorage>().removeFavoriteLocale(videoId);
  }

  wantToRemoveFavoriteDialog(BuildContext context, String videoId) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        removeFavoriteLocale(videoId);
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Deseja realmente remover o video favorito?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetVideosEvent());
  }

  @override
  Widget build(BuildContext context) {
    getFavoriteVideos();

    return Padding(
      padding: EdgeInsets.all(AppTheme.sizes.spacing16px),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return LoadingPageWidget();
          }

          if (state is HomeErrorState) {
            return Center(
              child: ErrorMessageWidget(),
            );
          }

          state = state as HomeSuccessState;
          var videoList = state.listVideos;

          return videoList.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: state.listVideos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoItemWidget(
                      video: videoList[index],
                      isFavorite: (favoriteIds.where((id) => id == videoList[index].videoId).toList().length == 1),
                      onTap: () => (favoriteIds.where((id) => id == videoList[index].videoId).toList().length == 1)
                          ? wantToRemoveFavoriteDialog(context, videoList[index].videoId)
                          : setFavoriteLocale(videoList[index].videoId),
                    );
                  })
              : Center(child: EmptyVideos());
        },
      ),
    );
  }
}
