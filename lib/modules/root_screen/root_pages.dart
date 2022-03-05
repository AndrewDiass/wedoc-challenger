import '../home_page/home_page.dart';

import '../favorite_page/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/root_screen_bloc.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoadedState) {
            // return FirstPage(text: state.text);
            return HomePage();
          }
          if (state is SecondPageLoadedState) {
            return FavoritePage(number: state.number);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        return BottomNavigationBar(
          currentIndex: context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video, color: Colors.black),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.black),
              label: 'Favoritos',
            ),
          ],
          onTap: (index) => context.read<BottomNavigationBloc>().add(PageTappedEvent(index: index)),
        );
      }),
    );
  }
}
