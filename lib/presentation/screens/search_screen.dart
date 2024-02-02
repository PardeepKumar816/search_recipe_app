import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_events.dart';
import 'package:recipe_search_app/presentation/widgets/heading_widget.dart';
import 'package:recipe_search_app/presentation/widgets/search_box.dart';
import 'package:recipe_search_app/presentation/widgets/search_recipe_bloc_builder_widget.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/constants.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // stateful screen is used here for disposing TextEditingController
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadingWidget(), // heading text
                const SizedBox(height: 48,),
                // textField for searching recipes
                // addEvent function will be called on submit or search btn click
                SearchBox(searchController: _searchController,function: _addEvent,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height / 2,
              color: whiteColor,
              // show list of recipes from api
              child: SearchRecipeBlocBuilderWidget(searchController: _searchController),
            ),
          )
        ],
      ),
    );
  }

  void _addEvent() {
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




























