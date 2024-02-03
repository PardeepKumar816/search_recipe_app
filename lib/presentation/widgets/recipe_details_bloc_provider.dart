import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_details_bloc/recipe_details_bloc.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_data_buttons_row.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_details_list_view.dart';
import 'package:recipe_search_app/presentation/widgets/recipes_box.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/helper_functions.dart';


class RecipeDetailsBlocProvider extends StatelessWidget {
  const RecipeDetailsBlocProvider({
    Key? key,required this.model
  }) : super(key: key);

  final RecipeDetailsModel model;

  @override
  Widget build(BuildContext context) {
    // blocProvider is used here to providing recipeDetailsBloc to its children
    // recipeDetailsBloc is used for managing the state of recipe details screen
    return BlocProvider<RecipeDetailsBloc>(
        create: (context) => RecipeDetailsBloc(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  width: getDeviceSize(context).width,
                  height: getDeviceSize(context).height / 2,
                  decoration: const  BoxDecoration(
                      color: primaryColor,
                      borderRadius:  BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      // recipeBox is being used here with providing RecipeDetailsModel in constructor
                      RecipeBox(element: model),
                      const SizedBox(height: 24,),
                      // row containing ingredient,steps and nutrition buttons
                      const RecipeDataButtonsRow()
                    ],
                  )),
            ),
            Expanded(
              // show ingredients, steps or nutrition based on state
              child: RecipeDetailsListView(model: model,),
            ),
          ],
        )
    );
  }
}