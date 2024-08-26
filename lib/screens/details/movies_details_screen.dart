import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/screens/details/cubit/movies_details_screen_view_model.dart';
import 'package:movies_app_c11/screens/details/cubit/movies_details_state.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/recommended_section/recommended_move_item.dart';
import 'package:movies_app_c11/theme/app_colors.dart';
import 'package:movies_app_c11/utils/app_utils.dart';
import 'package:readmore/readmore.dart';

class MoviesDetailsScreen extends StatelessWidget {
  static const String routeName = 'MoviesDetailsScreen';
  MoviesDetailsScreenViewModel viewModel = MoviesDetailsScreenViewModel();

  MoviesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Results;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    viewModel.getSimilarMoviesByMovieId(args.id!);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          title: Text(
            args.title!,
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    '${AppUtils.missingImageUrl}${args.backdropPath}',
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: height * 0.25,
                    child: const Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 80, color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.0145739910313901,
                      left: width * .0533980582524272),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        args.title!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        args.releaseDate!,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(
                        height: height * 0.0224215246636771,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${AppUtils.missingImageUrl}${args.posterPath}',
                                          width: width * 0.3,
                                          height: height * 0.2,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          placeholder: (context, url) => Center(
                                            child: Lottie.asset(
                                                'assets/lottie/loading.json'),
                                          ),
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_add,
                                          color: AppColors.watchListIcon,
                                          size: 40,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              //////////////////////////////////////////////////
                              SizedBox(
                                height: height * 0.15,
                                width: width * 0.5,
                                child: SingleChildScrollView(
                                  child: ReadMoreText(
                                    args.overview!,
                                    lessStyle: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.primaryColor
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.bold),
                                    moreStyle: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.primaryColor
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.bold),
                                    trimMode: TrimMode.Line,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.withOpacity(1)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.025,
                            horizontal: width * 0.085),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 28),
                            Text(
                              args.voteAverage!.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<MoviesDetailsScreenViewModel,
                              MoviesDetailsState>(
                          bloc: viewModel,
                          builder: (context, state) {
                            if (state is MoviesLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is MoviesErrorState) {
                              return Center(
                                child: Text(state.errorMessage),
                              );
                            } else if (state is MoviesSuccessState) {
                              return RecommendedMoveItem(
                                movies: state.moviesResult,
                                title: 'More Like This',
                              );
                            }
                            return Container();
                          })
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
