import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otus_hwork7_recipe_list/core/error/exception.dart';
import 'package:otus_hwork7_recipe_list/feature/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<RecipeModel>> getAllRecipes(int page);

  /// Calls the https://rickandmortyapi.com/api/character/?name=rick endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<RecipeModel>> searchRecipe(String query);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client? client;

  RecipeRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<RecipeModel>> getAllRecipes(int page) => _getRecipeFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<RecipeModel>> searchRecipe(String query) => _getRecipeFromUrl(
      'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<RecipeModel>> _getRecipeFromUrl(String url) async {
    debugPrint(url);
    final response = await client!
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final recipes = json.decode(response.body);
      return (recipes['results'] as List)
          .map((recipe) => RecipeModel.fromJson(recipe))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
