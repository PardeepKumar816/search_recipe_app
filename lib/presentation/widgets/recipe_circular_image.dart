import 'package:flutter/material.dart';

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
          color: Colors.white),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit
              .cover, // You can adjust the BoxFit as needed
        ),
      ),
    );
  }
}