import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_events.dart';
import 'package:recipe_search_app/presentation/widgets/search_button.dart';
import 'package:recipe_search_app/presentation/widgets/search_text_field.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/constants.dart';

import 'clear_search_field_button.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController searchController,
  }) : _searchController = searchController, super(key: key);

  final TextEditingController _searchController;
  // final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: getDeviceSize(context).width,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: secondaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // search btn with search icon
          // addEvent function will be called on submit or search btn click
          SearchButton(function: _addEvent),
          const SizedBox(width: 12,),
          // text field for inserting query for recipe search
          SearchTextField(searchController: _searchController, function: _addEvent),
          const SizedBox(width: 12,),
          // icon btn to clear search text field
          ClearSearchFieldButton(searchController: _searchController),
        ],
      ),
    );
  }

  void _addEvent(BuildContext context) {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      // if query is not empty then fetch recipes from api by add event
      BlocProvider.of<RecipeBloc>(context).add(FetchRecipeEvent(query));
    } else {
      // if query is empty after clicking submit button or search button then
      // show snackBar
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Search for Recipes")));
    }
  }
}

