import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/data/api_manager/api_manager.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/presentation/home/news/sources/sources_list_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     // DefaultTabController(
    //     //     length: widget.sources.length,
    //     //     child: TabBar(
    //     //       unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall,
    //     //       labelStyle: Theme.of(context).textTheme.headlineMedium,
    //     //       onTap: (index) {
    //     //         tappedIndex = index;
    //     //
    //     //         setState(() {});
    //     //       },
    //     //       tabAlignment: TabAlignment.start,
    //     //       isScrollable: true,
    //     //       dividerColor: Colors.transparent,
    //     //       indicatorColor: ColorsManager.white,
    //     //       tabs: widget.sources.map(
    //     //         (source) {
    //     //           return Tab(
    //     //             child: Text(
    //     //               source.name ?? '',
    //     //             ),
    //     //           );
    //     //         },
    //     //       ).toList(),
    //     //     )),
    //     // ArticlesWidget(sourceId: widget.sources[tappedIndex].id ?? '')
    //   ],
    // );

    return FutureBuilder(
      future: ApiManager.getArticlesSources(widget.categoryDM.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          ;
          return Center(
            child: Text("Error occured"),
          );
        }

        List<Source> sources = snapshot.data ?? [];
        return SourcesListWidget(sources: sources);
      },
    );
  }
}
