import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';
import 'package:news_app_c13_offline/data/model/articles_response/ArticlesResponse.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Sources_response.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

@singleton
class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "be69a84c535c43928fdad67c7cd21548";
  static const String sourceEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

  Future<Result<List<Source>>> getSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, sourceEndPoint, {
      "apiKey": apiKey,
      "category": categoryId,
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "ok") {
        return Success(data: sourcesResponse.sources ?? []);
      } else {
        return ServerError(
            code: sourcesResponse.code ?? '',
            message: sourcesResponse.message ?? '');
      }
    } on Exception catch (ex) {
      return Error(exception: ex);
    }
  }

  Future<Result<List<Article>>> getArticles(String sourceId) async {
    var url = Uri.https(baseUrl, articlesEndPoint, {
      "apiKey": apiKey,
      "sources": sourceId,
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "ok") {
        return Success(data: articlesResponse.articles ?? []);
      } else {
        return ServerError(
            code: articlesResponse.code ?? '',
            message: articlesResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
