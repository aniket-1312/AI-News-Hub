import 'package:flutter/material.dart';
import '../data/news_repository.dart';
import '../models/article_model.dart';

class NewsProvider extends ChangeNotifier {
  final NewsRepository repository;

  List<Article> articles = [];
  List<Article> favorites = [];

  bool isLoading = false;
  int page = 1;

  NewsProvider(this.repository);

  Future<void> fetchNews({bool loadMore = false}) async {
    if (loadMore) page++;

    isLoading = true;
    notifyListeners();

    final newArticles = await repository.getNews(page);

    loadMore ? articles.addAll(newArticles) : articles = newArticles;

    isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(Article article) {
    favorites.contains(article)
        ? favorites.remove(article)
        : favorites.add(article);
    notifyListeners();
  }
}
