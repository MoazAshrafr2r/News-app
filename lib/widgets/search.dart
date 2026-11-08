import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class Search extends StatefulWidget {
  Search(this.data, this.Change, {super.key});

  final List<Articles> data;
  final Function(List<Articles>) Change;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Articles> searchData;
  @override
  void initState() {
    super.initState();
    searchData = widget.data;
  }

  // ignore: strict_top_level_inference
  filtaredItems(item) {
    setState(() {
      searchData = widget.data.where((artile) {
        // ignore: non_constant_identifier_names
        final ArticleTitle = artile.title?.toLowerCase() ?? '';
        final input = item.toLowerCase();
        return ArticleTitle.contains(input);
      }).toList();
    });
    widget.Change(searchData);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        filtaredItems(value);
      },
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),

      decoration: const InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF8B1538)),
        ),
      ),
    );
  }
}
