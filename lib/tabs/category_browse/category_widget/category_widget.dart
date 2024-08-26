import 'package:flutter/material.dart';
import 'package:movies_app_c11/model/Categories_Response.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/CategoryDetails.dart';

class CategoryWidget extends StatelessWidget {
  Genres genre;

  CategoryWidget({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryDetails.routeName,
          arguments: genre,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.38),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/images/categories/${genre.name}.jpg',
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                genre.name ?? '',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
