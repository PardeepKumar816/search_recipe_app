import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/recipie_bloc.dart';
import '../../bloc/recipie_events.dart';
import '../widgets/search_recipe_bloc_builder_widget.dart';
import '../widgets/heading_widget.dart';
import '../widgets/search_box.dart';

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
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe42648),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadingWidget(),
                const SizedBox(
                  height: 48,
                ),
                SearchBox(searchController: _searchController,function: _addEvent,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.white,
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
      BlocProvider.of<RecipeBloc>(context).add(FetchRecipeEvent(query));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please Search for Recipes")));
    }
  }

}




























