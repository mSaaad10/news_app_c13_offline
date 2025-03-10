import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/core/colors_manager.dart';
import 'package:news_app_c13_offline/data/model/sources_response/Source.dart';
import 'package:news_app_c13_offline/presentation/home/news/articles/atricles_list_widget.dart';

class SourcesListWidget extends StatefulWidget {
  const SourcesListWidget({super.key, required this.sources});

  final List<Source> sources;

  @override
  State<SourcesListWidget> createState() => _SourcesListWidgetState();
}

class _SourcesListWidgetState extends State<SourcesListWidget> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall,
              labelStyle: Theme.of(context).textTheme.headlineMedium,
              onTap: (index) {
                tappedIndex = index;

                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: ColorsManager.white,
              tabs: widget.sources.map(
                (source) {
                  return Tab(
                    child: Text(
                      source.name ?? '',
                    ),
                  );
                },
              ).toList(),
            )),
        ArticlesListWidget(sourceId: widget.sources[tappedIndex].id ?? '')
      ],
    );
  }
}
