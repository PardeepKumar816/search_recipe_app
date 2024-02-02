import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/presentation/screens/recipe_details_screen.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_circular_image.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_text_widget.dart';
import 'package:recipe_search_app/utils/colors.dart';

import 'image_dialog.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox({
    Key? key,required this.element
  }) : super(key: key);

  final dynamic element;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // recipe box is used at two different places
        // check if recipe box is being use in search screen
        onTap: element is Results ? () {
          // check if id for particular recipe is available or not
          if(element.id > 0) {
            // navigate to RecipeDetailsScreen with recipe id
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
              // providing bloc instance to child
                  BlocProvider.value(
                    value: RecipeBloc(),
                    child: RecipeDetailsScreen(
                        recipeId: element.id),
                  ),
            ),
          );
          }else{
            // if recipe id is not available then show snackBar to user
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recipe Details are not available")));
          }
          //  if recipe box is being use in recipe details screen
        } : (){
          showImageDialog(context, element.image,element.summary);
        },
        child: Container(
          width: 250,
          height: 240,
          decoration:  BoxDecoration(
              color: element is Results ? primaryColor : secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              RecipeCircularImage(imageUrl: element.image),
              const SizedBox(
                height: 8,
              ),
              RecipeTextWidget(title: element.title), // recipe name
              const SizedBox(
                height: 8,
              ),
               // if recipe box is being use in search screen then on clicking the box
               // user will navigate to recipe details screen and in details screen it will
               // show the recipe image
               Text(
               element is Results ? "Click to Check Recipe" : "Click to View Image" ,
                style: const TextStyle(color: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );

  }
}