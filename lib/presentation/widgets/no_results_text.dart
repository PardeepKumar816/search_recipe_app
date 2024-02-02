import 'package:flutter/material.dart';

class NoResultsText extends StatelessWidget {
  const NoResultsText({
    Key? key,required this.searchQuery
  }) :  super(key: key);

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text("No Recipe based on $searchQuery",style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
      ),
    );
  }
}