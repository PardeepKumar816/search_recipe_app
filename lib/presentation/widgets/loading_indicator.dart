import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color:primaryColor ,),
    );
  }
}