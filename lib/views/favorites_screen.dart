import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/article_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: provider.favorites.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
        itemCount: provider.favorites.length,
        itemBuilder: (_, i) =>
            ArticleCard(article: provider.favorites[i]),
      ),
    );
  }
}
