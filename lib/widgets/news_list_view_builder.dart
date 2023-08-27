import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/news_list_view.dart';

import '../models/article_model.dart';
import '../services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
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
      builder: (context) => NewsListView(articles: articles),
      fallback: (context) => const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
