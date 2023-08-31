import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({super.key, required this.category});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;

  @override
  void initState() {
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data);
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(child: Text('Oops, an error occurred, try later')),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
