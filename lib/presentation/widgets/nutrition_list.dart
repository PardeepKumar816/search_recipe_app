import 'package:flutter/material.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';



class NutritionList extends StatelessWidget {
  const NutritionList({
    Key? key,required this.nutrient
  }) : super(key: key);

  final Nutrients nutrient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
          child: Row(
            children: [
              Text('${nutrient.name}:',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(width: 4,),
              Flexible(
                child: Text(
                  '${nutrient.amount} ${nutrient.unit}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}