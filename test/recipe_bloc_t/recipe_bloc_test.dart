import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_events.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_states.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/data/repositories/api_repository.dart';
import 'recipe_bloc_test.mocks.dart';
import '../test_constants/test_constants.dart';

// To run the test => Flutter test test/recipe_bloc_t/recipe_bloc_test.dart


// Mocking the ApiRepository class
class MockApiRepository extends Mock implements ApiRepository {}

// creating a mock instance of RecipeModel for testing purposes
RecipeModel getMockRecipeModel() {
  return RecipeModel.fromJson(jsonDecode(searchRecipeJsonString));
}

// creating a mock instance of RecipeDetailsModel for testing purposes
RecipeDetailsModel getMockRecipeDetailsModel(){
  return RecipeDetailsModel.fromJson(jsonDecode(getRecipeDetailsJsonString));
}

// generating mocks using the annotations
@GenerateMocks([MockApiRepository])
void main() {
  group('RecipeBloc', () {
    late RecipeBloc recipeBloc;
    late MockMockApiRepository mockApiRepository;

    setUp(() {
      mockApiRepository = MockMockApiRepository();
      recipeBloc = RecipeBloc();
    });

    test('initial state is InitialState', () {
      // assert: Checking if the result meets the expected conditions
      expect(recipeBloc.state, equals(InitialState()));
    });


    blocTest<RecipeBloc, RecipeState>(
      'emits [LoadingState, LoadedRecipeState] when FetchRecipeEvent is added',
      build: () => recipeBloc,
      act: (bloc) async {
        final mockRecipeModel = getMockRecipeModel();

        // arrange: Stubbing - Setting up the behavior of the mockApiRepository.searchRecipes()
        when(mockApiRepository.searchRecipes('any'))
            .thenAnswer((_) => Future.value(mockRecipeModel));

        // act: Add a FetchRecipeEvent with query
        bloc.add(FetchRecipeEvent('any'));
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        // assert: Checking if the result meets the expected conditions
        isA<LoadingState>(),
        isA<LoadedRecipeState>(),
      ],
    );

    blocTest<RecipeBloc, RecipeState>(
      'emits [LoadingState, LoadedRecipeDetailsState] when FetchRecipeDetailsEvent is added',
      build: () => recipeBloc,
      act: (bloc) async {
        final mockRecipeDetailsModel = getMockRecipeDetailsModel();

        // arrange: Stubbing - Setting up the behavior of the mockApiRepository.getRecipeDetails()
        when(mockApiRepository.getRecipeDetails(654857))
            .thenAnswer((_) => Future.value(mockRecipeDetailsModel));

        // act: Add a FetchRecipeDetailsEvent with valid ID
        bloc.add(FetchRecipeDetailsEvent(654857));
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        // assert: Checking if the result meets the expected conditions
        isA<LoadingState>(),
        isA<LoadedRecipeDetailsState>(),
      ],
    );

    blocTest<RecipeBloc, RecipeState>(
      'emits [LoadingState, ErrorState] when getRecipeDetails fails with invalid ID',
      build: () => recipeBloc,
      act: (bloc) async {

        // arrange: Stubbing - Setting up the behavior of the mockApiRepository.getRecipeDetails()
        when(mockApiRepository.getRecipeDetails(0))
            .thenAnswer((_) => Future.error('A recipe with the id 0 does not exist.'));

        // act: Add a FetchRecipeDetailsEvent with an invalid recipe ID
        bloc.add(FetchRecipeDetailsEvent(0));
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        // assert: Checking if the result meets the expected conditions
        isA<LoadingState>(),
        isA<ErrorState>(),
      ],
    );


    // dispose the bloc after done with testing
    tearDown(() {
      recipeBloc.close();
    });

  });
}
