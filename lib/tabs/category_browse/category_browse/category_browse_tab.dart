import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/cubit/Sources_State.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/cubit/category_browse_tab_view_model.dart';

import 'category_widget/category_widget.dart';

class CategoryBrowseTab extends StatelessWidget {
  final CategoryBrowseTabViewModel viewModel = CategoryBrowseTabViewModel();

  CategoryBrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.getGenries();

    return BlocBuilder<CategoryBrowseTabViewModel, CategorySourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (viewModel.category == null || viewModel.category!.isEmpty == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.category != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20),
                child: Text(
                  "Browse Category",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 38,
                    mainAxisSpacing: 35,
                    mainAxisExtent: 110,
                    crossAxisCount: 2,
                  ),
                  padding: const EdgeInsets.all(30),
                  itemCount: viewModel.category!.length,
                  itemBuilder: (context, index) {
                    // print('Building item at index: $index');
                    return CategoryWidget(
                      genre: viewModel.category![index],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is GenriesErrorState) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else {
          return const Center(child: Text("No categories available."));
        }
      },
    );
  }
}
