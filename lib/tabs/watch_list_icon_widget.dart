import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/movies_response.dart';

class WatchListIconWidget extends StatelessWidget {
  Results movie;
  double bottom;

  double right;

  WatchListIconWidget(
      {super.key,
      required this.right,
      required this.bottom,
      required this.movie});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottom,
        right: right,
        child: IconButton(
          onPressed: () {
            print('Add ${movie.title} To Watch List');
          },
          icon: InkWell(child: Image.asset('assets/images/watchlist_icon.png')),
        ));
  }
}
