import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'article_details_screen.dart';
import 'models/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space News',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => ArticleDetailsScreen(
          article: ModalRoute.of(context)!.settings.arguments as Article,
        ),
      },
    );
  }
}
