import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/top_side_section/movie_image_widget.dart';

class MovieBannerSlider extends StatelessWidget {
  List<Results> popularMoviesList;
  int selectedIndex = 0;
  MovieBannerSlider({super.key, required this.popularMoviesList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('go to details ');
      },
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.4,
          viewportFraction: 1,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
        ),
        itemCount: popularMoviesList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return MovieImageWidget(
                  movie: popularMoviesList[itemIndex],
          width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height);
            }));
  }
}
