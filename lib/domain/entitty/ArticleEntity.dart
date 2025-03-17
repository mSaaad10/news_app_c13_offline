import 'package:news_app_c13_offline/domain/entitty/SourceEntity.dart';

class ArticleEntity {
  ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  ArticleEntity.fromJson(dynamic json) {
    source =
        json['source'] != null ? SourceEntity.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }

  SourceEntity? source;
  String? author;
  String? title;
  String? url;
  String? urlToImage;
  String? publishedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    return map;
  }
}
