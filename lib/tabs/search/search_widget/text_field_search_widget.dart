import 'package:flutter/material.dart';
import 'package:movies_app_c11/tabs/search/cubit/search_tab_view_model.dart';

class TextFieldSearchWidget extends StatelessWidget {
  SearchTabViewModel viewModel;

  TextFieldSearchWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: viewModel.searchController,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          filled: true,
          fillColor: Colors.grey[800],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        onChanged: viewModel.onSearchTextChanged,
      ),
    );
  }
}
