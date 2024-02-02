import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';

class ClearSearchFieldButton extends StatelessWidget {
  const ClearSearchFieldButton({
    Key? key,
    required TextEditingController searchController,
  }) : _searchController = searchController, super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      _searchController.text = "";
    }, icon: const Icon(Icons.clear,color: whiteColor,));
  }
}