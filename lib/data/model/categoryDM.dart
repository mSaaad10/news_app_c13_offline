import 'package:news_app_c13_offline/core/assets_manager.dart';

class CategoryDM {
  final String categoryId;
  final String imagePath;

  const CategoryDM({required this.categoryId, required this.imagePath});

  static List<CategoryDM> categories = const [
    CategoryDM(categoryId: "general", imagePath: AssetsManager.general),
    CategoryDM(categoryId: "business", imagePath: AssetsManager.business),
    CategoryDM(categoryId: "sports", imagePath: AssetsManager.sports),
    CategoryDM(categoryId: "health", imagePath: AssetsManager.health),
    CategoryDM(
        categoryId: "entertainment", imagePath: AssetsManager.entertainment),
    CategoryDM(categoryId: "science", imagePath: AssetsManager.science),
    CategoryDM(categoryId: "technology", imagePath: AssetsManager.technology),
  ];
}
