import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';

class SourcesDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;

  /// dependency injection
  SourcesDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Source>>> getSources(String categoryId) {
    return apiManager.getSources(categoryId);
  }
}
