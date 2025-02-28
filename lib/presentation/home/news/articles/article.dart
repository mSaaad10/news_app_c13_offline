import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/data/model/articles_response/Articles.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                article.author ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              )),
              Expanded(
                  child: Text(
                article.publishedAt ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
