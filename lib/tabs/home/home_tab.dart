import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/home/cubit/home_tab_view_model.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/new_releases_section/new_releases_move_item.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/recommended_section/recommended_move_item.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/top_side_section/movie_banner_slider.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getPopularMovies();
    viewModel.getNewReleasesMovies();
    viewModel.getTopRatedMovies();
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeTabViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is PopularMoviesLoadingState ||
            state is NewReleasesMoviesLoadingState ||
            state is TopRatedMoviesLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourceErrorState) {
          return Center(
            child: Text('Error: ${state.errorMessage}'),
          );
        } else if (state is PopularMoviesSuccessState ||
            state is NewReleasesMoviesSuccessState ||
            state is TopRatedMoviesSuccessState) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (viewModel.popularMovies != null)
                    MovieBannerSlider(
                        popularMoviesList: viewModel.popularMovies!),
                  SizedBox(
                    height: height * 0.0269058295964126,
                  ),
                  if (viewModel.getNewReleasesMovies != null)
                    NewReleasesMoveItem(
                        newReleasesMovies: viewModel.newReleasesMovies!),
                  SizedBox(
                    height: height * 0.0269058295964126,
                  ),
                  if (viewModel.topRatedMovies != null)
                    RecommendedMoveItem(topMovies: viewModel.topRatedMovies!),
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
