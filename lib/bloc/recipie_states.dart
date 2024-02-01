

import 'package:equatable/equatable.dart';

import '../data/models/recipe_details_model.dart';
import '../data/models/recipe_model.dart';

abstract class RecipeState {}

class InitialState extends RecipeState {}

class LoadingState extends RecipeState {}


class LoadedRecipeState extends RecipeState {
  final RecipeModel data;

  LoadedRecipeState(this.data);
}

class LoadedRecipeDetailsState extends RecipeState {
  final RecipeDetailsModel data;

  LoadedRecipeDetailsState(this.data);
}


class ErrorState extends RecipeState {
  final String message;

  ErrorState(this.message);
}