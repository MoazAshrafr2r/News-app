import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final title = articles.title ?? '';

    final date = articles.publishedAt ?? '';
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 220, 216, 216),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, '/details', arguments: articles),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 232, 230, 230),
                  ),
                  child: Text(
                    articles.sourceName?.name ?? '',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(width: 15),
                Icon(Icons.verified, color: Color(0xFF8B1538)),
                SizedBox(width: 10),

                Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    date.length >= 10 ? date.substring(0, 10) : date,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 120,
                  child: articles.urlToImage != null
                      ? Image.network(
                          articles.urlToImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image),
                        )
                      : const Icon(Icons.image_not_supported),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
