
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_events.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_states.dart';
import 'package:recipe_search_app/data/repositories/api_repository.dart';




class RecipeBloc extends Bloc<RecipeEvents,RecipeState>{
  RecipeBloc() : super(InitialState()){

    final apiRepository = ApiRepository();
   // fetching list of recipes based on search query or ingredient
    on<FetchRecipeEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final recipes = await apiRepository.searchRecipes(event.query);
        emit(LoadedRecipeState(recipes));
      } catch (ex) {
        emit(ErrorState(ex.toString()));
      }
    });

    // fetching details of particular recipes based on recipe id
    on<FetchRecipeDetailsEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final recipeDetails = await apiRepository.getRecipeDetails(event.recipeId);
        emit(LoadedRecipeDetailsState(recipeDetails));
      } catch (ex) {
        emit(ErrorState(ex.toString()));
      }
    });

  }
}