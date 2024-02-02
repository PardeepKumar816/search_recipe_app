
abstract class RecipeEvents {}


class FetchRecipeEvent extends RecipeEvents {
  final String query;

  FetchRecipeEvent(this.query);
}

class FetchRecipeDetailsEvent extends RecipeEvents {
  final int recipeId;

  FetchRecipeDetailsEvent(this.recipeId);
}