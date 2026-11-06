import 'package:news_app/core/network/api_consumer.dart';
import 'package:news_app/core/network/end_porints.dart';
import 'package:news_app/models/article_model.dart';

class Reposotory {
  // ignore: non_constant_identifier_names
  final Api_consumer Api;
  Reposotory({required this.Api});

  Future<List<Articles>> fetchTopHeadlines({
    String country = 'us',
    required String category,
    int page = 1,
  }) async {
    // ignore: non_constant_identifier_names
    final Response = await Api.get(
      EndPoints.topHeadlines,
      query: {
        'country': country,
        'page': page,
        'pageSize': EndPoints.pageSize,
        'category': category,
        'apiKey': EndPoints.apiKey,
      },
    );
    final articles = Response["articles"] as List? ?? [];

    return articles.map((article) => Articles.fromJson(article)).toList();
  }

  Future<List<Articles>> searchArticlis({
    required String category,
    String country = 'us',
  }) async {
    // ignore: non_constant_identifier_names
    final Response = await Api.get(
      EndPoints.everything,
      query: {'q': category, 'country': country},
    );
    final articles = Response["articles"] as List? ?? [];

    return articles.map((article) => Articles.fromJson(article)).toList();
  }
}
