import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/data/repositories/api_provider.dart';
import '../test_constants/test_constants.dart';
import 'api_provider_test.mocks.dart';

// To run the test => Flutter test test/api_provider/api_provider_test.dart

@GenerateMocks([http.Client])
void main(){
  late MockClient mockClient;
  late ApiProvider apiProvider;

  setUp(() {
    mockClient = MockClient();
    apiProvider = ApiProvider(mockClient);
  });

  group("ApiProvider -", () {

    group("searchRecipes function", () {
       // 1:test
      test('given ApiProvider class when searchRecipes function is called and status code is 200 then a RecipesModel should be returned',
              () async {
            // arrange: Stubbing - Setting up the behavior of the mockClient
            when(mockClient.get(searchRecipeUrl))
                .thenAnswer((_) async => http.Response(searchRecipeJsonString, 200));
            // act: Calling the actual function that uses the mockClient
            final result = await apiProvider.searchRecipes("pasta");
            // assert: Checking if the result meets the expected conditions
            expect(result, isA<RecipeModel>());
          });
      // 2:test
      test('given ApiProvider class when searchRecipes function is called and status code is not 200 then a exception should be thrown',
              () async {
        // arrange: Stubbing - Setting up the behavior of the mockClient
        when(mockClient.get(searchRecipeUrl)).thenAnswer((_) async => http.Response('', 404));
        // act: Calling the actual function that uses the mockClient
        final result = apiProvider.searchRecipes("pasta");
        // assert: Checking if the result meets the expected conditions
        expect(result, throwsException);
      });

    });

    group("getRecipeDetails function", () {
      // 3:test
      test('given ApiProvider class when getRecipeDetails function is called and status code is 200 then a RecipeDetailsModel should be returned',
              () async {
            // arrange: Stubbing - Setting up the behavior of the mockClient
            when(mockClient.get(getRecipeDetailsUrl))
                .thenAnswer((_) async => http.Response(
                getRecipeDetailsJsonString,
                200));
            // act: Calling the actual function that uses the mockClient
            final result = await apiProvider.getRecipeDetails(654857);
            // assert: Checking if the result meets the expected conditions
            expect(result, isA<RecipeDetailsModel>());
          });
      // 4:test
      test('given ApiProvider class when getRecipeDetails function is called and status code is not 200 then a exception should be thrown',
              () async {
            // arrange: Stubbing - Setting up the behavior of the mockClient
            when(mockClient.get(getRecipeDetailsUrl)).thenAnswer((_) async => http.Response('', 404));
            // act: Calling the actual function that uses the mockClient
            final result = apiProvider.getRecipeDetails(654857);
            // assert: Checking if the result meets the expected conditions
            expect(result, throwsException);
          });
    });
    // disposing the mockClient after done with testing
    tearDown(() {
      mockClient.close();
    });
  });
}