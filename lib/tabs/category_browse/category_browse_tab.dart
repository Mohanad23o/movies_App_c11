import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/tabs/category_browse/category_details/CategoryDetails.dart';
import 'package:movies_app_c11/tabs/category_browse/cubit/Sources_State.dart';
import 'package:movies_app_c11/tabs/category_browse/cubit/category_cubit.dart';
import 'category_widget/category_widget.dart';

class CategoryBrowseTab extends StatelessWidget {
  final CategoryCubit viewModel = CategoryCubit();

  @override
  Widget build(BuildContext context) {
    viewModel.getGenries();

    return BlocBuilder<CategoryCubit, CategorySourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (viewModel.categore == null || viewModel.categore!.isEmpty ==true) {
          return Center(child: CircularProgressIndicator());
        }
        else if (viewModel.categore != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Text(
                  "Browse Category",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 38,
                    mainAxisSpacing: 35,
                    mainAxisExtent: 110,
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.all(30),
                  itemCount: viewModel.categore!.length,
                  itemBuilder: (context, index) {
                    print('Building item at index: $index');
                    return CategoryWidget(genre: viewModel.categore![index],

                    );
                  },
                ),
              ),
            ],
          );
        }
        else if (state is GenriesErrorState) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else {
          return Center(child: Text("No categories available."));
        }
      },
    );
  }
}

