import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/article_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    final filtered = provider.articles
        .where((a) =>
        a.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search articles...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) =>
                  ArticleCard(article: filtered[i]),
            ),
          )
        ],
      ),
    );
  }
}
