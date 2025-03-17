import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';

abstract class ArticlesDataSource {
  Future<Result<List<Article>>> getArticles(String sourceId);
}
