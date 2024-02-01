import 'package:flutter/material.dart';

class InitialSearchText extends StatelessWidget {
  const InitialSearchText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Search for the Recipes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
    );
  }
}