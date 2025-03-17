import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/ArticleEntity.dart';
import 'package:news_app_c13_offline/domain/repository_contract/articles_repo_contract.dart';

class GetArticlesUseCase {
  ArticlesRepo repo;

  GetArticlesUseCase({required this.repo});

  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) {
    return repo.getArticles(sourceId);
  }
}
