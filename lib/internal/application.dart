import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otus_hwork7_recipe_list/feature/presentation/pages/recipe_list_screen.dart';

import '../common/app_colors.dart';
import '../generated/l10n.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final Locale _locale = const Locale('ru');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context) => S.of(context).title,
      theme: ThemeData(
        primarySwatch: AppColors.materialColor, // Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RecipeListScreen(),
//      initialRoute: '/RecipeListScreen',
    );
  }
}
