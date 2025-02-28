import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c13_offline/data/model/categoryDM.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryDM});

  final CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Image.asset(categoryDM.imagePath));
  }
}
