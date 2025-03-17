import 'package:news_app_c13_offline/core/base_state/base_state.dart';
import 'package:news_app_c13_offline/core/base_state/base_viewModel.dart';
import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/ArticleEntity.dart';
import 'package:news_app_c13_offline/domain/usecases/get_articles_usecase.dart';

// loose coupling
class ArticlesViewModel extends BaseViewModel {
  GetArticlesUseCase useCase;

  ArticlesViewModel({required this.useCase});

  void getArticles(String sourceId) async {
    emit(LoadingState());
    var result = await useCase.getArticles(sourceId);
    switch (result) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: result));
    }
  }
}

//// solid
