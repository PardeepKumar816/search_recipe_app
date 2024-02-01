import 'package:flutter/material.dart';


class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          message,
          style: const TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}