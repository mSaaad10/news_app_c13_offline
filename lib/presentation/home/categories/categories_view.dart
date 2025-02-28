import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';
import 'package:news_app_c13_offline/presentation/home/categories/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.onCategoryClicked});

  final void Function(CategoryDM) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 15, left: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
              padding: REdgeInsets.only(top: 16),
              separatorBuilder: (context, index) => SizedBox(
                height: 16.h,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClicked(CategoryDM.categories[index]);
                  },
                  child:
                      CategoryItem(categoryDM: CategoryDM.categories[index])),
              itemCount: CategoryDM.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
