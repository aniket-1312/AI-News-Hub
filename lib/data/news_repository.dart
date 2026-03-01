import '../models/article_model.dart';
import '../services/api_service.dart';

class NewsRepository {
  final ApiService apiService;
  NewsRepository(this.apiService);

  Future<List<Article>> getNews(int page) async {
    final data = await apiService.fetchNews(page);
    return data.map((e) => Article.fromJson(e)).toList();
  }
}
