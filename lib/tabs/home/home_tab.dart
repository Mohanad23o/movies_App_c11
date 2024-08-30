import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/home/cubit/home_tab_view_model.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/new_releases_section/new_releases_movie_item.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/recommended_section/recommended_movie_item.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/top_side_section/movie_banner_slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeTabViewModel();
    viewModel.getPopularMovies();
    viewModel.getNewReleasesMovies();
    viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeTabViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is PopularMoviesLoadingState ||
            state is NewReleasesMoviesLoadingState ||
            state is TopRatedMoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourceErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${state.errorMessage}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
             const  SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getPopularMovies();
                    viewModel.getNewReleasesMovies();
                    viewModel.getTopRatedMovies();
                  },
                  child:const Text('Try again'))
            ],
          );
        } else if (state is PopularMoviesSuccessState ||
            state is NewReleasesMoviesSuccessState ||
            state is TopRatedMoviesSuccessState) {
/*          print("444444444444444444444444444444444444444");
          print(viewModel.topRatedMovies![0].title);
          print(viewModel.topRatedMovies![0].onWatchList);*/
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (viewModel.popularMovies != null &&
                      viewModel.popularMovies!.isNotEmpty)
                    MovieBannerSlider(
                        popularMoviesList: viewModel.popularMovies!),
                  SizedBox(
                    height: height * 0.0269,
                  ),
                  if (viewModel.newReleasesMovies != null &&
                      viewModel.newReleasesMovies!.isNotEmpty)
                    NewReleasesMovieItem(
                        newReleasesMovies: viewModel.newReleasesMovies!),
                  SizedBox(
                    height: height * 0.0269,
                  ),
                  if (viewModel.topRatedMovies != null &&
                      viewModel.topRatedMovies!.isNotEmpty)
                    RecommendedMovieItem(
                      movies: viewModel.topRatedMovies!,
                      title: 'Recommended',
                    ),
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