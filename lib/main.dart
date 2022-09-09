import 'package:flutter/material.dart';
import 'package:otus_hwork7_recipe_list/internal/application.dart';

final appKey = GlobalKey();

void main() {
  runApp(Application(key: appKey));
}
