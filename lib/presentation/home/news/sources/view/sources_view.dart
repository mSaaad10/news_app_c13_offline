import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/core/base_state/base_state.dart';
import 'package:news_app_c13_offline/core/widget/loading_widget.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/data/data_source_impl/sources_datasource_impl.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/data/repo_impl/sources_repo_impl.dart';
import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';
import 'package:news_app_c13_offline/domain/usecases/get_sources_usecase.dart';
import 'package:news_app_c13_offline/presentation/home/news/sources/view/sources_list_widget.dart';
import 'package:news_app_c13_offline/presentation/home/news/sources/viewModel/sources_viewModel.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({
    super.key,
    required this.categoryDM,
  });

  final CategoryDM categoryDM;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  int tappedIndex = 0;
  late SourcesViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = SourcesViewModel(
        useCase: GetSourcesUseCase(
            sourcesRepo: SourcesRepoImpl(
                dataSource: SourcesDataSourceImpl(ApiManager()))));

    viewModel.getSources(widget.categoryDM.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              List<SourceEntity> sources = state.data ?? [];
              return SourcesListWidget(sources: sources);
            case LoadingState():
              return LoadingWidget();
            case ErrorState():
              return Text(state.serverError?.message ?? '');
          }
          // if(viewModel.isLoading){
          //   return LoadingWidget();
          // }
          // if(viewModel.errorMessage != null){
          //   return Center(child: Text(viewModel.errorMessage!),);
          // }
        },
      ),
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(widget.categoryDM.categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       ;
    //       return Center(
    //         child: Text("Error occured"),
    //       );
    //     }
    //
    //     List<Source> sources = snapshot.data ?? [];
    //     return SourcesListWidget(sources: sources);
    //   },
    // );
  }
}
