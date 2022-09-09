import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../generated/l10n.dart';
import '../widgets/recipe_list_view.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.recipeList),
          backgroundColor: AppColors.greyColor,
        ),
        body: const RecipeListView());
  }
}
