import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';


class ShowRecipeDataButton extends StatelessWidget {
  const ShowRecipeDataButton(
      {Key? key,
        required this.isActive,
        required this.function,
        required this.text})
      : super(key: key);

  final bool isActive;
  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function.call();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              isActive ? primaryColor : whiteColor),
          foregroundColor:
          MaterialStatePropertyAll(isActive ? whiteColor : blackColor),
          textStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: 11,
          )),
          fixedSize: const MaterialStatePropertyAll(Size(96, 33)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13))))),
      child: Text(text),
    );

  }
}