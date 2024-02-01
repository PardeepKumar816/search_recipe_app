import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required TextEditingController searchController,
    required this.function,
  }) : _searchController = searchController, super(key: key);

  final TextEditingController _searchController;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width-160,
      child: TextField(
        controller: _searchController,
        style:  const TextStyle(
            color: Color(0xffffffff), fontSize: 20.0,fontWeight: FontWeight.w400),
        decoration: const  InputDecoration(
          hintText: "burger",
          hintStyle: TextStyle(color: Color(0xfff0c8c7), fontSize: 20.0,fontWeight: FontWeight.w400),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (value) {
          function.call();
        },
      ),
    );
  }
}