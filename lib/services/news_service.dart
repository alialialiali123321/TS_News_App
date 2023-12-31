import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  getTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=da3d341845c8419fbe24a61dfa450048&category=$category');

      ArticleModel articleModel = ArticleModel.fromJson(response.data);

      return articleModel;
    } catch (e) {
      log(e.toString());
    }
  }
}
