import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: NewsTile(
            articleModel: ArticleModel(
              image:
                  'https://cdn.britannica.com/84/73184-050-05ED59CB/Sunflower-field-Fargo-North-Dakota.jpg',
              title:
                  'hghgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggncxv',
              subTitle:
                  'hghgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggncxv',
            ),
          ),
        );
      },
    );
  }
}
