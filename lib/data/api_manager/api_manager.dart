import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';
import 'package:news_app_c13_offline/data/model/articles_response/ArticlesResponse.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Sources_response.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "be69a84c535c43928fdad67c7cd21548";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

  static Future<List<Source>?> getArticlesSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, sourceEndPoint, {
      "apiKey": apiKey,
      "category": categoryId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse.sources;
  }

  static Future<List<Article>?> getArticles(String sourceId) async {
    var url = Uri.https(baseUrl, articlesEndPoint, {
      "apiKey": apiKey,
      "sources": sourceId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse.articles;
  }
}
