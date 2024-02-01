import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        "unleash the CHEF in you",
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}