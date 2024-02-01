import 'package:flutter/material.dart';

import '../../data/models/recipe_details_model.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    Key? key,required this.step
  }) : super(key: key);

  final Steps step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(step.number.toString(),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
              const SizedBox(width: 12,),
              Flexible(child: Text(step.step,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
              //const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}