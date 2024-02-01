import 'package:flutter/material.dart';
import 'package:recipe_search_app/presentation/widgets/steps_list.dart';

import '../../data/models/recipe_details_model.dart';
import 'ingredients_list.dart';
import 'nutrition_list.dart';



class RecipeDetailsListView extends StatelessWidget {
  const RecipeDetailsListView({
    Key? key,required this.model,
    required this.showNutrition,required this.showSteps,required this.showIngredients
  }) : super(key: key);

  final RecipeDetailsModel model;
  final bool showIngredients;
  final bool showSteps;
  final bool showNutrition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  showIngredients
              ? model.extendedIngredients.map((ingredient) {
            return IngredientsList(ingredient: ingredient,);
          }).toList()
              : showSteps
              ? model.analyzedInstructions
              .expand((instructions) => instructions.steps)
              .map((step) {
            return StepsList(step: step,);
          }).toList()
              : showNutrition
              ? model.nutrition.nutrients.map((nutrient) {
            return NutritionList(nutrient: nutrient,);
          }).toList()
              : [],
        ),
      ),
    );
  }
}