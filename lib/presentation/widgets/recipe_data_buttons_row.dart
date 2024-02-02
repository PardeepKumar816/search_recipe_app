import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_events.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_states.dart';
import 'package:recipe_search_app/presentation/widgets/show_recipe_data_button.dart';


class RecipeDataButtonsRow extends StatelessWidget {
  const RecipeDataButtonsRow({
    Key? key,
  }) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsBloc,DetailsStates>(
          builder: (context,state) {
            // here count value is used to check which btn is active
            int? count;
            if(state is IngredientState){
              // when user click on ingredient btn then assign count with 0
              count = 0;
            }else if(state is NutritionState){
              // when user click on nutrition btn then assign count with -1
              count = -1;
            }else if(state is StepsState){
              // when user click on steps btn then assign count with 1
              count = 1;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShowRecipeDataButton(
                  text: "Ingredients",
                   // if count is 0 then make ingredient btn active
                   isActive: count == 0 ? true : false,
                  // on clicking ingredient btn add IngredientEvent
                  function:() => BlocProvider.of<RecipeDetailsBloc>(context,listen: false).add(IngredientEvent()),
                ),
                ShowRecipeDataButton(
                  text: "Steps",
                  // if count is positive then make steps btn active
                   isActive: count! > 0  ? true : false,
                  // on clicking steps btn add StepsEvent
                  function: () => BlocProvider.of<RecipeDetailsBloc>(context,listen: false).add(StepsEvent()),
                ),
                ShowRecipeDataButton(
                  text: "Nutrition",
                  // if count is negative then make nutrition btn active
                  isActive: count < 0 ? true : false ,
                  // on clicking nutrition btn add NutritionEvent
                  function:() => BlocProvider.of<RecipeDetailsBloc>(context,listen: false).add(NutritionEvent()),
                )
              ],
            );
          }
      );
  }
}