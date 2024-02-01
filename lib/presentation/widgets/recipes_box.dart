import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipie_bloc.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_circular_image.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_text_widget.dart';

import '../screens/recipe_details_screen.dart';
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
        onTap: element is Results ? () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  BlocProvider.value(
                    value: RecipeBloc(),
                    child: RecipeDetailsScreen(
                        recipeId: element.id),
                  ),
            ),
          );
        } : (){
          showImageDialog(context, element.image);
        },
        child: Container(
          width: 250,
          height: 210,
          decoration:  BoxDecoration(
              color: element is Results ? const Color(0xffe42648) : const Color(0xffFF4163),
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              RecipeCircularImage(imageUrl: element.image),
              const SizedBox(
                height: 8,
              ),
              RecipeTextWidget(title: element.title),
              const SizedBox(
                height: 8,
              ),
               Text(
               element is Results ? "Click to Check Recipe" : "Click to view Image" ,
                style: const TextStyle(color: Color(0xfff1e1e0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}