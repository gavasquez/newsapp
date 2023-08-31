import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  String _URL_NEW = 'newsapi.org';
  String _APIKEY = '2320e25ad9004180a39e312584585481';
  List<Article> headlines = [];

  // Constructor
  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(
        _URL_NEW, 'v2/top-headlines', {'apiKey': _APIKEY, 'country': 'co'});
    final resp = await http.get(url);
    final newResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newResponse.articles);
    print(headlines);
    notifyListeners();
  }
}
