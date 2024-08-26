import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_c11/model/movies_response.dart';
import 'package:movies_app_c11/screens/details/movies_details_screen.dart';
import 'package:movies_app_c11/utils/app_utils.dart';

class SearchWidget extends StatelessWidget {
  List<Results>? searchResults;

  SearchWidget({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults!.length,
      itemBuilder: (context, index) {
        var movie = searchResults![index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(MoviesDetailsScreen.routeName,
                  arguments: searchResults![index]);
            },
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.2,
                      imageUrl:
                          '${AppUtils.missingImageUrl}${movie.posterPath}',
                      height: MediaQuery.of(context).size.width * 0.3,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) => Center(
                        child: Lottie.asset('assets/lottie/loading.json'),
                      ),
                    )),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        movie.releaseDate ?? "N/A",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005),
                      Text(
                        movie.overview ?? "No description available",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}