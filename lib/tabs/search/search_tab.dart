import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_state.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_view_model.dart';
import 'package:movies_app_c11/tabs/search/search_widget/search_widget.dart';
import 'package:movies_app_c11/tabs/search/search_widget/unsearch_widget.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  SearchTabViewModel viewModel = SearchTabViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          UnsearchWidget(viewModel: viewModel),
          Expanded(
            child: BlocBuilder<SearchTabViewModel, SourceSearchState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is SourceSearchLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SourceSearchErrorState) {
                  return Center(
                    child: Text(
                      'Error: ${state.errorMessage}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state is SourceUnSearchSuccessState) {
                  return Center(
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
    );
  }
}
