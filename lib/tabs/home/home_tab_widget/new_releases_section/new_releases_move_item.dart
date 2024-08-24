import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/UpcomingResponse.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

import 'new_releases_move_item_widget.dart';

class NewReleasesMoveItem extends StatefulWidget {
  final List<Movies> newReleasesMovies;

  NewReleasesMoveItem({
    super.key,
    required this.newReleasesMovies,
  });

  @override
  State<NewReleasesMoveItem> createState() => _NewReleasesMoveItemState();
}

class _NewReleasesMoveItemState extends State<NewReleasesMoveItem> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: AppColors.moviesListContainerColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'New Releases',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewReleasesMoveItemWidget(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      movie: widget.newReleasesMovies[index],
                    );
                  },
                  itemCount: widget.newReleasesMovies.length),
            ),
          ],
        ),
      ),
    );
  }
}
