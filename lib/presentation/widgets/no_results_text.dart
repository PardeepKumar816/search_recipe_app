import 'package:flutter/material.dart';

class NoResultsText extends StatelessWidget {
  const NoResultsText({
    Key? key,
    required TextEditingController searchController,
  }) : _searchController = searchController, super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text("No Recipe based on ${_searchController.text}",style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
      ),
    );
  }
}