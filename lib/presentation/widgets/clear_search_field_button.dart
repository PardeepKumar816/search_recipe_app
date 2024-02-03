import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';

class ClearSearchFieldButton extends StatelessWidget {
  const ClearSearchFieldButton({
    Key? key,
    required TextEditingController searchTextController,
  }) : _searchTextController = searchTextController, super(key: key);

  final TextEditingController _searchTextController;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      _searchTextController.text = "";
    }, icon: const Icon(Icons.clear,color: whiteColor,),
      tooltip: 'Clear Search',
    );
  }
}