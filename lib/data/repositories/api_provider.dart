
import 'dart:convert';

import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_search_app/utils/strings.dart';

class ApiProvider {
  final http.Client _client;

  ApiProvider(this._client);

   Future<RecipeModel> searchRecipes(String query) async {
    try {
      final response = await _client.get(
        Uri.parse("$baseURL/recipes/complexSearch?apiKey=$apiKey&query=$query"),
      );
      final data = json.decode(response.body);
      return RecipeModel.fromJson(data);
    } catch (error) {
      throw Exception('Failed to load recipes');
    }
  }

   Future<RecipeDetailsModel> getRecipeDetails(int recipeId) async {
    try {
      final response = await _client.get(
        Uri.parse(
            '$baseURL/recipes/$recipeId/information?apiKey=$apiKey&includeNutrition=true&addRecipeInformation=true'),
      );
      final data = json.decode(response.body);
      return RecipeDetailsModel.fromJson(data);
    } catch (error) {
      throw Exception('Failed to load recipes information');
    }
  }
}