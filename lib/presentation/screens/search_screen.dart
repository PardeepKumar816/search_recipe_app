import 'package:flutter/material.dart';
import 'package:recipe_search_app/presentation/widgets/heading_widget.dart';
import 'package:recipe_search_app/presentation/widgets/search_box.dart';
import 'package:recipe_search_app/presentation/widgets/search_recipe_bloc_builder_widget.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/helper_functions.dart';

// stateful screen is used here for disposing TextEditingController
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchTextController = TextEditingController();


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
                SearchBox(searchController: _searchTextController),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height / 2,
              color: whiteColor,
              // show list of recipes from api
              child: SearchRecipeBlocBuilderWidget(searchQuery: _searchTextController.text),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

}




























