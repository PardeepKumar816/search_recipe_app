import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_events.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_states.dart';


class RecipeDetailsBloc extends Bloc<DetailsEvents,DetailsStates>{
  RecipeDetailsBloc() : super(IngredientState()){
   // event will be added when clicking on ingredient button in RecipeDetailsScreen
    on<IngredientEvent>((event, emit) async {
      // IngredientState will be emitted to active ingredient btn in RecipeDetailsScreen
      emit(IngredientState());
    });

    // event will be added when clicking on steps button in RecipeDetailsScreen
    on<StepsEvent>((event, emit) async {
      // StepsState will be emitted to active steps btn in RecipeDetailsScreen
      emit(StepsState());
    });

    // event will be added when clicking on nutrition button in RecipeDetailsScreen
    on<NutritionEvent>((event, emit) async {
      // NutritionState will be emitted to active nutrition btn in RecipeDetailsScreen
      emit(NutritionState());
    });
  }
}