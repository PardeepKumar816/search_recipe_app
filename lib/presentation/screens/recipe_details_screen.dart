import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_events.dart';
import 'package:recipe_search_app/bloc/recipe_bloc/recipe_states.dart';
import 'package:recipe_search_app/presentation/widgets/error_text.dart';
import 'package:recipe_search_app/presentation/widgets/loading_indicator.dart';
import 'package:recipe_search_app/presentation/widgets/recipe_details_bloc_provider.dart';
import 'package:recipe_search_app/utils/colors.dart';


// here stateful widget is used only for initState
class RecipeDetailsScreen extends StatefulWidget {
  final int recipeId;

  const RecipeDetailsScreen({Key? key, required this.recipeId})
      : super(key: key);

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {

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
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingIndicator();
          } else if (state is LoadedRecipeDetailsState) {
            // on successful recipe details fetch
            return  RecipeDetailsBlocProvider(model:state.data);
          } else if (state is ErrorState) {
            return ErrorText(message: state.message,);
          } else {
            return const Center(child: Text('Unknown State'),
            );
          }
        }),
      ),
    );
  }
}














