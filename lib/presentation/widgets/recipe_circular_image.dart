import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';

class RecipeCircularImage extends StatelessWidget {
  const RecipeCircularImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor),
      child: ClipOval(
        child: imageUrl.isNotEmpty ? Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ) : const SizedBox.shrink()
      ),
    );
  }
}