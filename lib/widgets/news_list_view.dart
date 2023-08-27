import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../services/news_service.dart';
import 'news_tile.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  ArticleModel? articles;
  @override
  void initState() {
    getGeneralNews();
    super.initState();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getTopHeadlines();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: articles != null,
      builder: (context) => SliverList.builder(
        itemCount: articles!.articles!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(articles: articles!.articles![index]),
          );
        },
      ),
      fallback: (context) => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
