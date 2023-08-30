import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  // Constructor
  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Cargando...');
  }
}