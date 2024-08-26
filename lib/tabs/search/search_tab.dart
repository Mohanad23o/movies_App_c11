import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_state.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_view_model.dart';
import 'package:movies_app_c11/tabs/search/search_widget/search_widget.dart';
import 'package:movies_app_c11/tabs/search/search_widget/text_field_search_widget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  SearchTabViewModel viewModel = SearchTabViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            TextFieldSearchWidget(viewModel: viewModel),
            Expanded(
              child: BlocBuilder<SearchTabViewModel, SourceSearchState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state is SourceSearchLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SourceSearchErrorState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${state.errorMessage}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel
                                  .getSearchedMovies(viewModel.searchQuery);
                            },
                            child:const Text('Try again'))
                      ],
                    );
                  } else if (state is SourceUnSearchSuccessState ||
                      viewModel.searchResults!.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie_creation_outlined,
                            size: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'No movies found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is SourceSearchSuccessState) {
                    return SearchWidget(searchResults: viewModel.searchResults);
                  }
                  return Container(); // Placeholder for initial state or error
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}