// ignore_for_file: depend_on_referenced_packages

import 'package:otus_hwork7_recipe_list/core/error/exception.dart';
import 'package:otus_hwork7_recipe_list/core/platform/network_info.dart';
import 'package:otus_hwork7_recipe_list/feature/data/datasources/recipe_local_data_source.dart';
import 'package:otus_hwork7_recipe_list/feature/data/datasources/recipe_remote_data_source.dart';
import 'package:otus_hwork7_recipe_list/feature/data/models/recipe_model.dart';
import 'package:otus_hwork7_recipe_list/feature/domain/entities/recipe_entity.dart';
import 'package:otus_hwork7_recipe_list/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:otus_hwork7_recipe_list/feature/domain/repositories/recipe_repository.dart';
import 'package:meta/meta.dart' show required;

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource? remoteDataSource;
  final RecipeLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  RecipeRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes(int page) async {
    return await _getRecipes(() {
      return remoteDataSource!.getAllRecipes(page);
    });
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> searchRecipe(String query) async {
    return await _getRecipes(() {
      return remoteDataSource!.searchRecipe(query);
    });
  }

  Future<Either<Failure, List<RecipeModel>>> _getRecipes(
      Future<List<RecipeModel>> Function() getRecipes) async {
    if (await networkInfo!.isConnected) {
      try {
        final remoteRecipe = await getRecipes();
        localDataSource!.recipesToCache(remoteRecipe);
        return Right(remoteRecipe);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRecipe = await localDataSource!.getLastRecipesFromCache();
        return Right(localRecipe);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
