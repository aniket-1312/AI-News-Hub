import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article_model.dart';
import '../providers/news_provider.dart';
import '../views/detail_screen.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    final isFav = provider.favorites.contains(article);

    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: article.imageUrl,
          width: 60,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => const Icon(Icons.image),
        ),
        title: Text(article.title, maxLines: 2),
        trailing: IconButton(
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
          onPressed: () => provider.toggleFavorite(article),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(article: article),
          ),
        ),
      ),
    );
  }
}
