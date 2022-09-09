import 'package:dartz/dartz.dart';
import 'package:otus_hwork7_recipe_list/feature/domain/entities/recipe_entity.dart';
import 'package:otus_hwork7_recipe_list/core/error/failure.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes(int page);
  Future<Either<Failure, List<RecipeEntity>>> searchRecipe(String query);
}
