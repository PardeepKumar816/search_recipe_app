import 'package:flutter/material.dart';
import 'package:recipe_search_app/utils/colors.dart';
import 'package:recipe_search_app/utils/helper_functions.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;
  final String summary;

  const ImageDialog({super.key, required this.imageUrl, required this.summary});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(secondaryColor),
                foregroundColor: MaterialStatePropertyAll(whiteColor),
                textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 11,
                )),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))))),
            child: const Text('Close'),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          children: [
           imageUrl.isNotEmpty
               ? Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height/ 2,
              decoration: BoxDecoration(
                color: whiteColor,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
               : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // removeHtmlTags will remove all html tags in summary string
              child: Text(removeHtmlTags(summary)),
            ),
          ],
        ),
      ),
    );
  }
}


void showImageDialog(BuildContext context, String imageUrl,String summary) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ImageDialog(imageUrl: imageUrl,summary: summary,);
    },
  );
}
