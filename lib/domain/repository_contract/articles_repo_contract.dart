import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/ArticleEntity.dart';

abstract class ArticlesRepo {
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId);
}
