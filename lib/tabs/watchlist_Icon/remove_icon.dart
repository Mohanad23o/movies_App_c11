import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/cubit/WatchList_Icon_view_model.dart';

import '../../theme/app_colors.dart';

class WatchListIconRemove extends StatelessWidget {
  final Results movie;
  final double bottom;
  final double right;

  WatchListIconRemove({
    super.key,
    required this.right,
    required this.bottom,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: IconButton(
        onPressed: () {
          movie.onWatchList = false;
          final viewModel = BlocProvider.of<WatchListIconViewModel>(context);
          viewModel.removeFromWatchLaterList(movie);
          Fluttertoast.showToast(
            msg: "Removed from watch later",
            backgroundColor: AppColors.moviesListContainerColor,
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
          );
        },
        icon: Image.asset('assets/images/watchlist_save_icon.png'),
      ),
    );
  }
}
