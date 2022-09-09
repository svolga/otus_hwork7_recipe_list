import 'package:otus_hwork7_recipe_list/feature/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel(
      {required super.id,
      required super.name,
      required super.duration,
      required super.photo});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
        id: json['id'],
        name: json['name'],
        duration: json['duration'],
        photo: json['photo']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'duration': duration, 'photo': photo};
}
