import 'package:flutter/material.dart';

import '../widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            children: <TextSpan>[
              TextSpan(
                text: category,
              ),
              const TextSpan(
                text: ' News',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(category: category),
        ],
      ),
    );
  }
}
