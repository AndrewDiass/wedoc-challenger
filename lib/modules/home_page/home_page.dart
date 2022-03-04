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
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CircularProgressIndicator();
            }

            if (state is HomeError) {
              return Center(
                child: Text(state.messageError),
              );
            }

            state = state as HomeSuccess;

            if (state.listVideos.isEmpty) {
              return Container();
            }
            print("state.listVideos");

            var videoList = state.listVideos as List<VideoModel>;

            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.listVideos.length,
                itemBuilder: (BuildContext context, int index) {
                  return VideoItem(
                    video: videoList[index],
                  );
                });
          },
        ));
  }
}
