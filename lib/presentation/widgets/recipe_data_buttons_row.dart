import 'package:flutter/material.dart';
import 'package:recipe_search_app/presentation/widgets/show_recipe_data_button.dart';


class RecipeDataButtonsRow extends StatelessWidget {
  const RecipeDataButtonsRow({
    Key? key,
    required bool showIngredients,
    required bool showSteps,
    required bool showNutrition,
    required this.function
  }) : _showIngredients = showIngredients, _showSteps = showSteps, _showNutrition = showNutrition, super(key: key);

  final bool _showIngredients;
  final bool _showSteps;
  final bool _showNutrition;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShowRecipeDataButton(
          text: "Ingredients",
          isActive: _showIngredients,
          function: function,
        ),
        ShowRecipeDataButton(
          text: "Steps",
          isActive: _showSteps,
          function: function,
        ),
        ShowRecipeDataButton(
          text: "Nutrition",
          isActive: _showNutrition,
          function: function,
        )
      ],
    );
  }
}