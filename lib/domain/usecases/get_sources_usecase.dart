import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';
import 'package:news_app_c13_offline/domain/repository_contract/sources_repo.dart';

class GetSourcesUseCase {
  SourcesRepo sourcesRepo;

  GetSourcesUseCase({required this.sourcesRepo});

  /// Functional requirement
  Future<Result<List<SourceEntity>>> getSourcesUseCase(String categoryId) {
    return sourcesRepo.getSources(categoryId);
  }
}
