import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/presentation/widgets/recipes_box.dart';
import '../../bloc/recipie_bloc.dart';
import '../../bloc/recipie_events.dart';
import '../../bloc/recipie_states.dart';
import '../widgets/error_text.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/recipe_data_buttons_row.dart';
import '../widgets/recipe_details_list_view.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final int recipeId;

  const RecipeDetailsScreen({Key? key, required this.recipeId})
      : super(key: key);

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool _showIngredients = true;
  bool _showSteps = false;
  bool _showNutrition = false;

  @override
  void initState() {
    super.initState();
    // Fetch recipe details when the screen is initialized
    BlocProvider.of<RecipeBloc>(context, listen: false)
        .add(FetchRecipeDetailsEvent(widget.recipeId));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
         // BlocProvider.of<RecipeBloc>(context,listen: false).add(FetchRecipeEvent(query));
          Navigator.pop(context);
        },),
        backgroundColor: const Color(0xffe42648),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingIndicator();
          } else if (state is LoadedRecipeDetailsState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                          color: Color(0xffe42648),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          RecipeBox(element: state.data),
                          const SizedBox(height: 24,),
                          RecipeDataButtonsRow(
                              showIngredients: _showIngredients,
                              showSteps: _showSteps,
                              showNutrition: _showNutrition,
                            function: _activeButton,
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: RecipeDetailsListView(
                    model: state.data,
                    showIngredients: _showIngredients,
                    showNutrition: _showNutrition,
                    showSteps: _showSteps,
                  ),
                ),
              ],
            );
          } else if (state is ErrorState) {
            return ErrorText(
              message: state.message,
            );
          } else {
            return const Center(
              child: Text('Unknown State'),
            );
          }
        }),
      ),
    );
  }

  void _activeButton(bool showIngredients, bool showSteps, bool showNutrition) {
    setState(() {
      _showIngredients = showIngredients;
      _showSteps = showSteps;
      _showNutrition = showNutrition;
    });
  }
}












