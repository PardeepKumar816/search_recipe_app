import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function.call();
        FocusScope.of(context).unfocus();
      },
      child: Image.asset("assets/icons/search.png",
        width: 20.0,height: 20.0,),
    );
  }
}