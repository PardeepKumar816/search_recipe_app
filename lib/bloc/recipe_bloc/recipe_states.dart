

import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';

abstract class RecipeState {}

class InitialState extends RecipeState {}

class LoadingState extends RecipeState {}

// state which will be emitted after successful data fetched
// when search recipes based on search query or ingredient
class LoadedRecipeState extends RecipeState {
  final RecipeModel data;
  LoadedRecipeState(this.data);
}
// state which will be emitted after successful data fetched
// when fetching recipe details based on recipe id
class LoadedRecipeDetailsState extends RecipeState {
  final RecipeDetailsModel data;
  LoadedRecipeDetailsState(this.data);
}


class ErrorState extends RecipeState {
  final String message;

  ErrorState(this.message);
}