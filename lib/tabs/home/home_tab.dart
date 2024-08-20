import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/tabs/home/cubit/home_tab_view_model.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/movie_banner_slider.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    viewModel.getPopularMovies();
    return BlocBuilder<HomeTabViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
              child: Lottie.asset('assets/lottie/loading.json',
                  repeat: true,
                  reverse: true,
                  frameRate: FrameRate(60),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5));
        } else if (state is SourceErrorState) {
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${state.errorMessage}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getPopularMovies();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        } else if (state is SourceSuccessState) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HomeTabTopSide(popularMoviesList: state.popularMoviesList),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
