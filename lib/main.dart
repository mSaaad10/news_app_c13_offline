import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/core/di/di.dart';
import 'package:news_app_c13_offline/new_app.dart';

void main() {
  configureDependencies();
  runApp(const NewsApp());
}
