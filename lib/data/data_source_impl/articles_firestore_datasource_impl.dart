import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';

class ArticlesFirestoreDatasourceImpl extends ArticlesDataSource {
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) {
    // TODO: implement getArticles
    /// write ur logic to get articles list from fire store
    throw UnimplementedError();
  }
}
