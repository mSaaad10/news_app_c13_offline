import 'package:injectable/injectable.dart';
import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/data/datasource_contract/sources_datasource.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';
import 'package:news_app_c13_offline/domain/repository_contract/sources_repo.dart';

@Injectable(as: SourcesRepo)
class SourcesRepoImpl extends SourcesRepo {
  SourcesDataSource dataSource;

  @factoryMethod
  SourcesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result = await dataSource.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        return Success(
            data: result.data
                .map(
                  (source) => source.toSourceEntity(),
            )
                .toList());
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }
}
