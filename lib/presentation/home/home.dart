import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/presentation/home/categories/categories_view.dart';
import 'package:news_app_c13_offline/presentation/home/home_drawer/home_drawer.dart';
import 'package:news_app_c13_offline/presentation/home/news/news_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget = CategoriesView(
    onCategoryClicked: onCategoryClicked,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: selectedWidget);
  }

  void onDrawerItemClicked() {
    selectedWidget = CategoriesView(onCategoryClicked: onCategoryClicked);
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryClicked(CategoryDM category) {
    selectedWidget = NewsView(
      category: category,
    );
    setState(() {});
  }
}
