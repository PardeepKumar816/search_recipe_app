

import 'package:equatable/equatable.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class InitialState extends RecipeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends RecipeState {
  @override
  List<Object> get props => [];
}

// state which will be emitted after successful data fetched
// when search recipes based on search query or ingredient
class LoadedRecipeState extends RecipeState {
  final RecipeModel data;
 const LoadedRecipeState(this.data);

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'LoadedRecipeState(data: $data)';
}
// state which will be emitted after successful data fetched
// when fetching recipe details based on recipe id
class LoadedRecipeDetailsState extends RecipeState {
  final RecipeDetailsModel data;
  const LoadedRecipeDetailsState(this.data);

  @override
  List<Object> get props => [data];
}


class ErrorState extends RecipeState {
  final String message;

 const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}