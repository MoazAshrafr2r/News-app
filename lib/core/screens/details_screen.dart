import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          article.urlToImage != null
              ? Image.network(article.urlToImage!)
              : Icon(Icons.image),
          Text(article.content!),
        ],
      ),
    );
  }
}
