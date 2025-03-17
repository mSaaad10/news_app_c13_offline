import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c13_offline/core/base_state/base_state.dart';
import 'package:news_app_c13_offline/core/widget/loading_widget.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/data/data_source_impl/articles_api_datasource_impl.dart';
import 'package:news_app_c13_offline/data/repo_impl/articles_repo_impl.dart';
import 'package:news_app_c13_offline/domain/entitty/ArticleEntity.dart';
import 'package:news_app_c13_offline/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_c13_offline/presentation/home/news/articles/view/article.dart';
import 'package:news_app_c13_offline/presentation/home/news/articles/viewModel/articles_viewModel.dart';
import 'package:provider/provider.dart';

class ArticlesListWidget extends StatefulWidget {
  const ArticlesListWidget({super.key, required this.sourceId});

  final String sourceId;

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  late ArticlesViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = ArticlesViewModel(
        useCase: GetArticlesUseCase(
            repo: ArticlesRepoImpl(
                dataSource: ArticlesApiDataSourceImpl(ApiManager()))));

    viewModel.getArticles(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant ArticlesListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId == widget.sourceId) return;
    viewModel.getArticles(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: ApiManager.getArticles(sourceId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Text("Error");
    //     }
    //     var articles = snapshot.data ?? [];
    //
    //     return Expanded(
    //       child: ListView.separated(
    //         padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
    //         separatorBuilder: (context, index) => SizedBox(
    //           height: 8.h,
    //         ),
    //         itemBuilder: (context, index) => ArticleWidget(
    //           article: articles[index],
    //         ),
    //         itemCount: articles.length,
    //       ),
    //     );
    //   },
    // );
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              List<ArticleEntity> articles = state.data ?? [];
              return Expanded(
                child: ListView.separated(
                  padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.h,
                  ),
                  itemBuilder: (context, index) => ArticleWidget(
                    article: articles[index],
                  ),
                  itemCount: articles.length,
                ),
              );
            case LoadingState():
              return LoadingWidget();
            case ErrorState():
              return Text(
                state.serverError?.message ?? '',
              );
          }
          // if (viewModel.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          //
          // if (viewModel.errorMessage != null) {
          //   return const  Center(child: Text("Error"));
          // }
          //
          // List<Article> articles = viewModel.articles ?? [];
          // return Expanded(
          //   child: ListView.separated(
          //     padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //     separatorBuilder: (context, index) => SizedBox(
          //       height: 8.h,
          //     ),
          //     itemBuilder: (context, index) => ArticleWidget(
          //       article: articles[index],
          //     ),
          //     itemCount: articles.length,
          //   ),
          // );
        },
      ),
    );
  }
}
