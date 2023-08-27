import 'package:flutter/material.dart';

import '../widgets/categories_list_view.dart';
import '../widgets/news_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'News',
              ),
              TextSpan(
                text: 'Cloud!',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            NewsListView(),
          ],
        ),
      ),
    );
  }
}
