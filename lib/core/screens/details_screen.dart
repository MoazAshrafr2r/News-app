import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    final date = article.publishedAt ?? '';
    final content = article.content ?? '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          article.sourceName?.name ?? 'Post',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.urlToImage!,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    height: 220,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              article.title ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              date.length >= 10 ? date.substring(0, 10) : date,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            if ((article.description ?? '').isNotEmpty)
              Text(
                article.description!,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            if (content.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
            const SizedBox(height: 24),
            if (article.url != null)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('go to article '),
                  onPressed: () => launchUrl(
                    Uri.parse(article.url!),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
