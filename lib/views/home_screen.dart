import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/article_card.dart';
import 'grid_screen.dart';
import 'search_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("AI News Hub"),
        actions: [
          IconButton(
              icon: Icon(Icons.grid_view),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GridScreen()))),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchScreen()))),
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FavoritesScreen()))),
        ],
      ),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: () => provider.fetchNews(),
        child: ListView.builder(
          itemCount: provider.articles.length,
          itemBuilder: (_, i) =>
              ArticleCard(article: provider.articles[i]),
        ),
      ),
    );
  }
}
