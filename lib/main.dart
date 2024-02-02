import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_search_app/presentation/screens/search_screen.dart';
import 'bloc/recipe_bloc/recipe_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeBloc(),
      child: MaterialApp(
            title: 'Food Recipes App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "IBM Plex Sans Thai",
              primarySwatch: Colors.blue,
            ),
            home: const SearchScreen(),
    )

    );
  }
}

