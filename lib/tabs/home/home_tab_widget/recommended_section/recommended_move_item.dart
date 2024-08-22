import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/TopRatedResponse.dart';
import 'package:movies_app_c11/tabs/home/home_tab_widget/recommended_section/recommended_move_item_widget.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class RecommendedMoveItem extends StatelessWidget {
  final List<TopMovies> topMovies;

  RecommendedMoveItem({
    required this.topMovies,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('go to details');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: AppColors.moviesListContainerColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Recommended',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => topMovies.isNotEmpty
                      ? RecommendedMoveItemWidget(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          topMovies: topMovies[index],
                        )
                      : Text('data'),
                  itemCount: topMovies.length),
            ),
          ],
        ),
      ),
    );
  }
}
