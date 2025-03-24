import 'package:injectable/injectable.dart';
import 'package:news_app_c13_offline/core/base_state/base_state.dart';
import 'package:news_app_c13_offline/core/base_state/base_viewModel.dart';
import 'package:news_app_c13_offline/core/result.dart';
import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';
import 'package:news_app_c13_offline/domain/usecases/get_sources_usecase.dart';

@injectable
class SourcesViewModel extends BaseViewModel {
  GetSourcesUseCase useCase;

  @factoryMethod
  SourcesViewModel({required this.useCase});

  void getSources(String categoryId) async {
    emit(LoadingState());
    var result = await useCase.getSourcesUseCase(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<SourceEntity>>():
        emit(ErrorState(error: result));
    }
  }
}
