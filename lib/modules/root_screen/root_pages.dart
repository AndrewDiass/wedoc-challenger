import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/theme/app_theme.dart';
import '../favorite_page/favorite_page.dart';
import '../home_page/home_page.dart';
import 'bloc/root_screen_bloc.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: AppBar(
        title: BlocBuilder<RootScreenBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            if (state is FirstPageLoadedState) {
              return Text("Vídeos");
            }
            if (state is SecondPageLoadedState) {
              return Text("Favoritos");
            }
            return Text("Vídeos");
          },
        ),
      ),
      body: BlocBuilder<RootScreenBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is FirstPageLoadedState) {
            return HomePage();
          }
          if (state is SecondPageLoadedState) {
            return FavoritePage();
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<RootScreenBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        return BottomNavigationBar(
          currentIndex: context.select((RootScreenBloc bloc) => bloc.currentIndex),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video, color: Colors.black),
              label: 'Vídeos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.black),
              label: 'Favoritos',
            ),
          ],
          onTap: (index) => context.read<RootScreenBloc>().add(PageTappedEvent(index: index)),
        );
      }),
    );
  }
}
