import 'package:flutter/material.dart';
import 'package:news_app/core/screens/details_screen.dart';
import 'package:news_app/core/screens/home.dart';
import 'package:news_app/core/screens/splash.dart';
import 'package:news_app/models/article_model.dart';

class AppRouter {
  // ignore: non_constant_identifier_names, body_might_complete_normally_nullable
  Route? GenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
      case '/home':
        return MaterialPageRoute(builder: ((context) => HomeScreen()));
      case '/details':
        // ignore: non_constant_identifier_names
        final Article = settings.arguments as Articles;
        return MaterialPageRoute(
          builder: ((context) => DetailsScreen(article: Article)),
        );
    }
  }
}
