import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/MoviesResponse.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/movie_image_widget.dart';

class HomeTabTopSide extends StatelessWidget {
  List<Results> popularMoviesList;

  HomeTabTopSide({required this.popularMoviesList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4,
        viewportFraction: 1,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      itemCount: popularMoviesList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          MovieImageWidget(
        movie: popularMoviesList[itemIndex],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
