// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otus_hwork7_recipe_list/core/error/exception.dart';
import 'package:otus_hwork7_recipe_list/feature/data/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RecipeLocalDataSource {
  /// Gets the cached [List<RecipeModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<RecipeModel>> getLastRecipesFromCache();
  Future<void> recipesToCache(List<RecipeModel> recipes);
}

const CACHED_RECIPES_LIST = 'CACHED_RECIPES_LIST';

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final SharedPreferences? sharedPreferences;

  RecipeLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<RecipeModel>> getLastRecipesFromCache() {
    final jsonRecipesList =
        sharedPreferences?.getStringList(CACHED_RECIPES_LIST);
    if (jsonRecipesList!.isNotEmpty) {
      debugPrint('Get Persons from Cache: ${jsonRecipesList.length}');
      return Future.value(jsonRecipesList
          .map((recipe) => RecipeModel.fromJson(json.decode(recipe)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> recipesToCache(List<RecipeModel> recipes) {
    final List<String> jsonRecipesList =
        recipes.map((recipe) => json.encode(recipe.toJson())).toList();

    sharedPreferences?.setStringList(CACHED_RECIPES_LIST, jsonRecipesList);
    debugPrint('Persons to write Cache: ${jsonRecipesList.length}');
    // ignore: void_checks
    return Future.value(jsonRecipesList);
  }
}
