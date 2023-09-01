import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const urlNews = 'newsapi.org';
const apiKey = 'f6527a607c4e4d7cbaf1516785f6804f';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  // Constructor
  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(
        urlNews, 'v2/top-headlines', {'apiKey': apiKey, 'sources': 'bbc-news'});
    final resp = await http.get(url);
    final newResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newResponse.articles);
    notifyListeners();
  }
}
