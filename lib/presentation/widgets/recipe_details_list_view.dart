import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_states.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/presentation/widgets/steps_column.dart';
import 'ingredient_column.dart';
import 'nutrition_column.dart';



class RecipeDetailsListView extends StatelessWidget {
  const RecipeDetailsListView({
    Key? key,required this.model,
  }) : super(key: key);

  final RecipeDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        child: BlocBuilder<RecipeDetailsBloc,DetailsStates>(
          builder: (context,state) {
            if(state is IngredientState){
              // if ingredient btn is active then show ingredients list
              return IngredientColumn(model: model);
            }else if(state is StepsState){
              // if steps btn is active then show steps list
              return StepsColumn(model: model);
            }else if(state is NutritionState){
              // if nutrition btn is active then show nutrition list
              return NutritionColumn(model: model);
            }else{
              return const SizedBox.shrink();
            }
          }
        ),
      ),
    );
  }
}





