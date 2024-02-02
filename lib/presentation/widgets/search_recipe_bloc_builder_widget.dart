import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_states.dart';
import 'package:recipe_search_app/presentation/widgets/recipes_list_widget.dart';
import 'error_text.dart';
import 'initial_search_text.dart';
import 'loading_indicator.dart';
import 'no_results_text.dart';

class SearchRecipeBlocBuilderWidget extends StatelessWidget {
  const SearchRecipeBlocBuilderWidget({
    Key? key,
    required this.searchQuery
  }) :super(key: key);

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingIndicator();
          } else if (state is LoadedRecipeState) {

            if (state.data.results!.isEmpty) {
              // if list from api is empty then show no result text
              return NoResultsText(searchQuery: searchQuery,);
            } else {
              // if list from api is not empty then show list of recipes
              return RecipesListWidget(recipesList: state.data.results!,);
            }

          } else if (state is ErrorState) {
            return  ErrorText(message: state.message,);
          }
          // when user haven't search for any recipe until then show initial text
          return const InitialSearchText();
        });
  }
}
