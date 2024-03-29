import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';

class RecipeTextWidget extends StatelessWidget {
  const RecipeTextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title, // recipe name
        style: const TextStyle(
            color: whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w700
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}