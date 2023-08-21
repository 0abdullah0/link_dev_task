import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article {
  Article({
    required this.title,
    required this.url,
    required this.description,
    required this.publishedAt,
    this.author,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  String? author;
  final String title;
  final String description;
  String? url;
  String? urlToImage;
  final DateTime publishedAt;
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
