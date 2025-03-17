import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';

abstract class SourcesRepo {
  Future<Result<List<SourceEntity>>> getSources(String categoryId);
}
