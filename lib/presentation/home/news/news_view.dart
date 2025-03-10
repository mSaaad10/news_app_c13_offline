import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/presentation/home/news/sources/sources_view.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryDM category;

  @override
  Widget build(BuildContext context) {
    return SourcesView(categoryDM: category);
  }
}
