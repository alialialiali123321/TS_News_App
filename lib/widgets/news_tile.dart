import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../views/news_webview.dart';

class NewsTile extends StatelessWidget {
  final Articles articles;

  const NewsTile({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsWebView(
              url: articles.url ??
                  'https://st4.depositphotos.com/5686152/27322/v/450/depositphotos_273220330-stock-illustration-sorry-page-found-404-error.jpg',
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Image(
              image: NetworkImage(
                articles.urlToImage ??
                    'https://www.goodwoodparkhotel.com/integration/tc-theme/public/img/placeholder_4_3.png',
              ),
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articles.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articles.description ?? '',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
