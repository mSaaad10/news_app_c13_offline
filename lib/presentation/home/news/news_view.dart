import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/presentation/home/news/sources/sources_list_widget.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.category});

  final CategoryDM category;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: [
    //       NewsSources(categoryDM: category,onSourceClicked: onSourceClick,),
    //       //ArticlesWidget(sourceId: ,),
    //     ],
    //   ),
    // );

    // return DefaultTabController(
    //
    //     length: sources.length,
    //     child: TabBar(
    //       unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall,
    //       labelStyle: Theme.of(context).textTheme.headlineMedium,
    //       onTap: (index) {
    //         tappedIndex = index;
    //         setState(() {
    //
    //         });
    //       },
    //       tabAlignment: TabAlignment.start,
    //       isScrollable: true,
    //       dividerColor: Colors.transparent,
    //       indicatorColor: ColorsManager.white,
    //       tabs:sources.map((source) {
    //
    //
    //        return  Tab(child: Text(source,),);
    //       } ,).toList(), ));
    return FutureBuilder(
      future: ApiManager.getArticlesSources(category.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<Source> sources = snapshot.data ?? [];
        return SourcesListWidget(
          sources: sources,
        );
      },
    );
  }
}
