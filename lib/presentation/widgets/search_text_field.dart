import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required TextEditingController searchTextController,
    required this.function,
  }) : _searchTextController = searchTextController, super(key: key);

  final TextEditingController _searchTextController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getDeviceSize(context).width-160,
      child: TextField(
        controller: _searchTextController,
        style:  const TextStyle(
            color: whiteColor, fontSize: 20.0,fontWeight: FontWeight.w400),
        decoration: const  InputDecoration(
          hintText: "burger",
          hintStyle: TextStyle(color: valenciaColor, fontSize: 20.0,fontWeight: FontWeight.w400),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (value) {
          // onSubmitting call the addEvent function
          function.call(context);
        },
      ),
    );
  }
}