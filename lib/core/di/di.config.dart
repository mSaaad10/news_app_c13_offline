// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager/api_manager.dart' as _i941;
import '../../data/data_source_impl/articles_api_datasource_impl.dart' as _i625;
import '../../data/data_source_impl/sources_datasource_impl.dart' as _i680;
import '../../data/datasource_contract/articles_datasource.dart' as _i928;
import '../../data/datasource_contract/sources_datasource.dart' as _i177;
import '../../data/repo_impl/articles_repo_impl.dart' as _i348;
import '../../data/repo_impl/sources_repo_impl.dart' as _i564;
import '../../domain/repository_contract/articles_repo_contract.dart' as _i1034;
import '../../domain/repository_contract/sources_repo.dart' as _i134;
import '../../domain/usecases/get_articles_usecase.dart' as _i165;
import '../../domain/usecases/get_sources_usecase.dart' as _i863;
import '../../presentation/home/news/articles/viewModel/articles_viewModel.dart'
as _i636;
import '../../presentation/home/news/sources/viewModel/sources_viewModel.dart'
as _i436;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i941.ApiManager>(() => _i941.ApiManager());
    gh.factory<_i177.SourcesDataSource>(
            () => _i680.SourcesDataSourceImpl(gh<_i941.ApiManager>()));
    gh.factory<_i928.ArticlesDataSource>(
            () => _i625.ArticlesApiDataSourceImpl(gh<_i941.ApiManager>()));
    gh.factory<_i134.SourcesRepo>(
            () =>
            _i564.SourcesRepoImpl(dataSource: gh<_i177.SourcesDataSource>()));
    gh.factory<_i1034.ArticlesRepo>(() =>
        _i348.ArticlesRepoImpl(dataSource: gh<_i928.ArticlesDataSource>()));
    gh.factory<_i863.GetSourcesUseCase>(
            () =>
            _i863.GetSourcesUseCase(sourcesRepo: gh<_i134.SourcesRepo>()));
    gh.factory<_i165.GetArticlesUseCase>(
            () => _i165.GetArticlesUseCase(repo: gh<_i1034.ArticlesRepo>()));
    gh.factory<_i436.SourcesViewModel>(
            () =>
            _i436.SourcesViewModel(useCase: gh<_i863.GetSourcesUseCase>()));
    gh.factory<_i636.ArticlesViewModel>(
            () =>
            _i636.ArticlesViewModel(useCase: gh<_i165.GetArticlesUseCase>()));
    return this;
  }
}
