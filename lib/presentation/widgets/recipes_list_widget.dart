import 'package:flutter/material.dart';
import 'package:recipe_search_app/presentation/widgets/recipes_box.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({
    Key? key,required this.results
  }) : super(key: key);

  final List results;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: results.map((e) {
                return RecipeBox(element: e,);
              }).toList()
          ),
        )

    );
  }
}