class Recipe {
  int? id;
  String? name;
  int? duration;
  String? photo;
  List<RecipeIngredients>? recipeIngredients;
  List<RecipeStepLinks>? recipeStepLinks;
  List<FavoriteRecipes>? favoriteRecipes;

  Recipe(
      {this.id,
      this.name,
      this.duration,
      this.photo,
      this.recipeIngredients,
      this.recipeStepLinks,
      this.favoriteRecipes});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    photo = json['photo'];
    if (json['recipeIngredients'] != null) {
      recipeIngredients = <RecipeIngredients>[];
      json['recipeIngredients'].forEach((v) {
        recipeIngredients!.add(RecipeIngredients.fromJson(v));
      });
    }
    if (json['recipeStepLinks'] != null) {
      recipeStepLinks = <RecipeStepLinks>[];
      json['recipeStepLinks'].forEach((v) {
        recipeStepLinks!.add(RecipeStepLinks.fromJson(v));
      });
    }
    if (json['favoriteRecipes'] != null) {
      favoriteRecipes = <FavoriteRecipes>[];
      json['favoriteRecipes'].forEach((v) {
        favoriteRecipes!.add(FavoriteRecipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['photo'] = photo;
    if (recipeIngredients != null) {
      data['recipeIngredients'] =
          recipeIngredients!.map((v) => v.toJson()).toList();
    }
    if (recipeStepLinks != null) {
      data['recipeStepLinks'] =
          recipeStepLinks!.map((v) => v.toJson()).toList();
    }
    if (favoriteRecipes != null) {
      data['favoriteRecipes'] =
          favoriteRecipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Recipe{id: $id, name: $name, duration: $duration, photo: $photo, recipeIngredients: $recipeIngredients, recipeStepLinks: $recipeStepLinks, favoriteRecipes: $favoriteRecipes}';
  }
}

class RecipeIngredients {
  int? id;
  int? count;
  Ingredient? ingredient;
  Ingredient? recipe;

  RecipeIngredients({this.id, this.count, this.ingredient, this.recipe});

  RecipeIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    recipe =
        json['recipe'] != null ? Ingredient.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    if (ingredient != null) {
      data['ingredient'] = ingredient!.toJson();
    }
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    return data;
  }
}

class Ingredient {
  int? id;

  Ingredient({this.id});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class RecipeStepLinks {
  int? id;
  int? number;
  Ingredient? recipe;
  Ingredient? step;

  RecipeStepLinks({this.id, this.number, this.recipe, this.step});

  RecipeStepLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    recipe =
        json['recipe'] != null ? Ingredient.fromJson(json['recipe']) : null;
    step = json['step'] != null ? Ingredient.fromJson(json['step']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (step != null) {
      data['step'] = step!.toJson();
    }
    return data;
  }
}

class FavoriteRecipes {
  int? id;
  Ingredient? recipe;
  Ingredient? user;

  FavoriteRecipes({this.id, this.recipe, this.user});

  FavoriteRecipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipe =
        json['recipe'] != null ? Ingredient.fromJson(json['recipe']) : null;
    user = json['user'] != null ? Ingredient.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
