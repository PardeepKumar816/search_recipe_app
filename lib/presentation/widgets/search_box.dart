import 'package:flutter/material.dart';
import 'package:recipe_search_app/presentation/widgets/search_button.dart';
import 'package:recipe_search_app/presentation/widgets/search_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required TextEditingController searchController,required this.function
  }) : _searchController = searchController, super(key: key);

  final TextEditingController _searchController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: Color(0xffff4163)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchButton(function: function),
          const SizedBox(width: 12,),
          SearchTextField(searchController: _searchController, function: function),
          const SizedBox(width: 12,),
          ClearSearchFieldButton(searchController: _searchController),
        ],
      ),
    );
  }
}

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
    }, icon: const Icon(Icons.clear,color: Colors.white,));
  }
}