import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article_model.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Article Detail")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const Icon(Icons.image, size: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                article.title,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(article.description),
            ),
          ],
        ),
      ),
    );
  }
}
