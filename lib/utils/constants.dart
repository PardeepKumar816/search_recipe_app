

import 'package:flutter/material.dart';

String removeHtmlTags(String htmlString) {
  // Define a regular expression to match HTML tags
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  // Replace HTML tags with an empty string
  return htmlString.replaceAll(exp, '');
}


Size getDeviceSize(context){
  return MediaQuery.of(context).size;
}
