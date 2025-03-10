import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/presentation/home/news/articles/article.dart';

class ArticlesListWidget extends StatelessWidget {
  const ArticlesListWidget({super.key, required this.sourceId});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        var articles = snapshot.data ?? [];

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
      },
    );
  }
}
