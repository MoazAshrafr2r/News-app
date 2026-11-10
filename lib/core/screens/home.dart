import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/logic/cubit/news_cubit.dart';
import 'package:news_app/widgets/article.dart';

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
  String _selected = 'general';
  String _query = '';

  Widget _buildBody(NewsState state) {
    if (state is NewsSuccess) {
      final visible = state.articles.where((a) {
        final title = (a.title ?? '').toLowerCase();
        return title.contains(_query.toLowerCase());
      }).toList();

      if (visible.isEmpty) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('No results')),
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: SliverList.separated(
          itemCount: visible.length,
          itemBuilder: (context, index) =>
              ArticleCard(articles: visible[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      );
    }

    if (state is NewsError) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.message),
              ElevatedButton(
                onPressed: () =>
                    context.read<NewsCubit>().fetchNews(category: _selected),
                child: const Text('Reload'),
              ),
            ],
          ),
        ),
      );
    }

    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            toolbarHeight: 72,
            title: TextField(
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),

              onChanged: (value) => setState(() => _query = value),
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B1538)),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: SizedBox(
                height: 56,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    spacing: 4,
                    children: HomeScreen.categories.map((category) {
                      return Container(
                        width: 122,
                        decoration: BoxDecoration(
                          color: _selected == category
                              ? const Color(0xFF8B1538)
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
              ),
            ),
          ),
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) => _buildBody(state),
          ),
        ],
      ),
    );
  }
}
