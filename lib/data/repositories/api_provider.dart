
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_search_app/utils/strings.dart';

class ApiProvider {
  final http.Client _client;

  ApiProvider(this._client);

   Future<RecipeModel> searchRecipes(String query) async {

      final response = await _client.get(
        Uri.parse("$baseURL/recipes/complexSearch?apiKey=${dotenv.get("APIKEY")}&query=$query"),
      );
      if(response.statusCode == 200){
        final data = json.decode(response.body);
        return RecipeModel.fromJson(data);
      }else{
        throw Exception('Failed to load recipes');
      }
  }

   Future<RecipeDetailsModel> getRecipeDetails(int recipeId) async {

      final response = await _client.get(
        Uri.parse(
            '$baseURL/recipes/$recipeId/information?apiKey=${dotenv.get("APIKEY")}&includeNutrition=true&addRecipeInformation=true'),
      );
      if(response.statusCode==200){
        final data = json.decode(response.body);
        return RecipeDetailsModel.fromJson(data);
      }else{
        throw Exception('Failed to load recipes information');
      }
  }

  // Closes the client and cleans up any resources associated with it.
  void dispose() {
    _client.close();
  }
}