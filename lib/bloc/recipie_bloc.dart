
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipie_events.dart';
import 'package:recipe_search_app/bloc/recipie_states.dart';

import '../data/repositories/recipes_repository.dart';


class RecipeBloc extends Bloc<RecipeEvents,RecipeState>{
  RecipeBloc() : super(InitialState()){

    on<FetchRecipeEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final recipes = await RecipesRepository.searchRecipes(event.query);
        emit(LoadedRecipeState(recipes));
      } catch (ex) {
        emit(ErrorState(ex.toString()));
      }
    });

    on<FetchRecipeDetailsEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final recipeDetails = await RecipesRepository.getRecipeDetails(event.recipeId);
        emit(LoadedRecipeDetailsState(recipeDetails));
      } catch (ex) {
        emit(ErrorState(ex.toString()));
      }
    });

  }
}