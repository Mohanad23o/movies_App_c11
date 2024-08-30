import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/watchlist_Icon/cubit/WatchList_Icon_view_model.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class WatchListIconWidget extends StatefulWidget {
  final Results movie;
  final double bottom;
  final double right;

  WatchListIconWidget({
    super.key,
    required this.right,
    required this.bottom,
    required this.movie,
  });

  @override
  State<WatchListIconWidget> createState() => _WatchListIconWidgetState();
}

class _WatchListIconWidgetState extends State<WatchListIconWidget> {
  late WatchListIconViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<WatchListIconViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottom,
      right: widget.right,
      child: IconButton(
        onPressed: () {
          setState(() {
            widget.movie.onWatchList = true;
          });
          viewModel.listFill(widget.movie);
          Fluttertoast.showToast(
            msg: "Added to watch later",
            backgroundColor: AppColors.moviesListContainerColor,
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
          );
        },
        icon: Image.asset('assets/images/watchlist_icon.png'),
      ),
    );
  }
}
