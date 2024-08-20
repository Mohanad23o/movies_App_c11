import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/tabs/home/cubit/home_tab_view_model.dart';
import 'package:movies_app_c11/tabs/home/cubit/sources_state.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/movie_banner_slider.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getPopularMovies();
    viewModel.getNewReleasesMovies();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeTabViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
              child: Lottie.asset('assets/lottie/loading.json',
                  repeat: true,
                  frameRate: const FrameRate(60),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5));
        } else if (state is SourceErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Center(
                      child: Lottie.asset('assets/lottie/error_ship.json',
                          repeat: true,
                          frameRate: FrameRate(60),
                          animate: true),
                    ),
                    Text(
                      'Error: ${state.errorMessage}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getPopularMovies();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is SourceSuccessState) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HomeTabTopSide(popularMoviesList: viewModel.popularMovies!),
                  SizedBox(
                    height: height * 0.0269058295964126,
                  ),
                  Container(
                    color: AppColors.greyColor,
                    width: double.infinity,
                    height: height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'New Releases ',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(15),
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500/${viewModel.newReleasesMovies?[index].posterPath}',
                                      width: width * 0.3,
                                      height: double.infinity,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      placeholder: (context, url) => Center(
                                        child: Lottie.asset(
                                            'assets/lottie/loading.json'),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.bookmark,
                                        color:
                                            Color.fromRGBO(128, 128, 128, 0.8),
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        print("Add to watch list");
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
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
