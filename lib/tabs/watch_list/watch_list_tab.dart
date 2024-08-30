import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/screens/home_screen.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/cubit/WatchList_Icon_view_model.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/cubit/Watch_list_icon_state.dart';

import '../../screens/details/movies_details_screen.dart';
import '../../theme/app_colors.dart';
import 'WatchList_Movie_Item.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  late WatchListIconViewModel viewModel;
  HomeScreen homeScreen = HomeScreen();

  @override
  void initState() {
    super.initState();
    viewModel = BlocProvider.of<WatchListIconViewModel>(context);
    viewModel.loadWatchLaterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20),
            child: Text(
              "WatchList",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          BlocBuilder<WatchListIconViewModel, WatchListIconState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is EmptyState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Text(
                    "The WatchList is Empty Right Now",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text(
                    "An error occurred. Please try again later .",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              } else if (state is SuccessState) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: AppColors.moviesItemContainerColor,
                      endIndent: 25,
                      indent: 25,
                    ),
                    itemCount: viewModel.savedMovies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MoviesDetailsScreen.routeName,
                              arguments: viewModel.savedMovies[index]);
                        },
                        child: WatchListMovieItem(
                          bottom: MediaQuery.of(context).size.height * 0.068,
                          right: MediaQuery.of(context).size.width * 0.34,
                          movie: viewModel.savedMovies[index],
                        ),
                      );
                    },
                  ),
                );
              }
              return Center();
            },
          ),
        ],
      ),
    );
  }
}
