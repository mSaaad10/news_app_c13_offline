import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSources(String categoryId);
}
