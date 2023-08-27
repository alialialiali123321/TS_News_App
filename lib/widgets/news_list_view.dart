import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final ArticleModel? articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: articles!.articles!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: NewsTile(articles: articles!.articles![index]),
        );
      },
    );
  }
}
