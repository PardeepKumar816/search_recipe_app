import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/utils/strings.dart';

final searchRecipeUrl =
    Uri.parse("$baseURL/recipes/complexSearch?apiKey=${dotenv.get("APIKEY")}&query=pasta");

final getRecipeDetailsUrl = Uri.parse(
    '$baseURL/recipes/654857/information?apiKey=${dotenv.get("APIKEY")}&includeNutrition=true&addRecipeInformation=true');





const searchRecipeJsonString = """  
 {
    "results": [
        {
            "id": 654959,
            "title": "Pasta With Tuna",
            "image": "https://spoonacular.com/recipeImages/654959-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 511728,
            "title": "Pasta Margherita",
            "image": "https://spoonacular.com/recipeImages/511728-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654857,
            "title": "Pasta On The Border",
            "image": "https://spoonacular.com/recipeImages/654857-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654883,
            "title": "Pasta Vegetable Soup",
            "image": "https://spoonacular.com/recipeImages/654883-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654928,
            "title": "Pasta With Italian Sausage",
            "image": "https://spoonacular.com/recipeImages/654928-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654926,
            "title": "Pasta With Gorgonzola Sauce",
            "image": "https://spoonacular.com/recipeImages/654926-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654944,
            "title": "Pasta With Salmon Cream Sauce",
            "image": "https://spoonacular.com/recipeImages/654944-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654905,
            "title": "Pasta With Chickpeas and Kale",
            "image": "https://spoonacular.com/recipeImages/654905-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654901,
            "title": "Pasta With Chicken and Broccoli",
            "image": "https://spoonacular.com/recipeImages/654901-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 654913,
            "title": "Pasta With Chicken and Mushrooms",
            "image": "https://spoonacular.com/recipeImages/654913-312x231.jpg",
            "imageType": "jpg"
        }
    ],
    "offset": 0,
    "number": 10,
    "totalResults": 261
}
 """;

const getRecipeDetailsJsonString = """
   {
    "vegetarian": false,
    "vegan": false,
    "glutenFree": false,
    "dairyFree": true,
    "veryHealthy": false,
    "cheap": false,
    "veryPopular": false,
    "sustainable": false,
    "lowFodmap": false,
    "weightWatcherSmartPoints": 13,
    "gaps": "no",
    "preparationMinutes": -1,
    "cookingMinutes": -1,
    "aggregateLikes": 1,
    "healthScore": 37,
    "creditsText": "foodista.com",
    "sourceName": "foodista.com",
    "pricePerServing": 298.3
    }
                """;
