import 'package:flutter/material.dart';

import '../../data/models/recipe_details_model.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,required this.ingredient
  }) : super(key: key);

  final ExtendedIngredients ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
              const SizedBox(width: 8,),
              Flexible(child: Text(ingredient.original,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
            ],
          ),
        ),
      ),
    );
  }
}