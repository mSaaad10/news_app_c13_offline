import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/datasource_contract/articles_datasource.dart';
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';
import 'package:news_app_c13_offline/domain/entitty/ArticleEntity.dart';
import 'package:news_app_c13_offline/domain/repository_contract/articles_repo_contract.dart';

class ArticlesRepoImpl extends ArticlesRepo {
  ArticlesDataSource dataSource;

  ArticlesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) async {
    var result = await dataSource.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        return Success(
            data: result.data
                .map(
                  (article) => article.toArticleEntity(),
                )
                .toList());
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}
