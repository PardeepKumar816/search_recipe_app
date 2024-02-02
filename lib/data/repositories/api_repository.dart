import 'package:http/http.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';

import 'api_provider.dart';

class ApiRepository {

  final _provider = ApiProvider(Client());

  Future<RecipeModel> searchRecipes(String query) {
    return _provider.searchRecipes(query);
  }

  Future<RecipeDetailsModel> getRecipeDetails(int recipeId) {
    return _provider.getRecipeDetails(recipeId);
  }

}
