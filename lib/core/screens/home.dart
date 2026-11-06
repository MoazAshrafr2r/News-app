import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/logic/cubit/news_cubit.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/article.dart';
import 'package:news_app/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const List<String> categories = [
    'general',
    'business',
    'technology',
    'sports',
    'health',
    'science',
    'entertainment',
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selected = '  ';
  List<Articles> _articles = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  if (state is NewsSuccess)
                    Search(state.articles, (filteredArticles) {
                      setState(() {
                        _articles = filteredArticles;
                      });
                    }),
                  SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 4,
                      children: HomeScreen.categories.map((category) {
                        return Container(
                          decoration: BoxDecoration(
                            color: _selected == category
                                ? const Color(0xFF8B1538) // مختار
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() => _selected = category);
                              context.read<NewsCubit>().fetchNews(
                                category: category,
                              );
                            },
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),

                  Expanded(
                    child: state is NewsSuccess
                        ? ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: _articles.isEmpty
                                ? state.articles.length
                                : _articles.length,
                            itemBuilder: (context, index) {
                              final article = _articles.isEmpty
                                  ? state.articles[index]
                                  : _articles[index];

                              return ArticleCard(articles: article);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
