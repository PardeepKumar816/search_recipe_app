import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/api_url.dart';
import '../models/recipe_details_model.dart';
import '../models/recipe_model.dart';

class RecipesRepository {


  static Future<RecipeModel> searchRecipes(String query) async {
    final response = await http.get(
      Uri.parse("$baseURL/recipes/complexSearch?apiKey=$apiKey&query=$query"),
    );

    if (response.statusCode == 200) {
      final  data = json.decode(response.body);
      return RecipeModel.fromJson(data);
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  static  Future<RecipeDetailsModel> getRecipeDetails(int recipeId) async {
    final response = await http.get(
      Uri.parse('$baseURL/recipes/$recipeId/information?apiKey=$apiKey&includeNutrition=true&addRecipeInformation=true'),
    );

    if (response.statusCode == 200) {
      final  data = json.decode(response.body);
      return RecipeDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to load recipes information');
    }
  }
}
