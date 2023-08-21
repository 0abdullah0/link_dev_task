// ignore_for_file: only_throw_errors, avoid_dynamic_calls

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:link_dev_task/app/data/constants.dart';
import 'package:link_dev_task/app/data/helpers/failure.dart';
import 'package:link_dev_task/app/data/helpers/http_client_service.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this.httpClientService);
  final HttpClientService httpClientService;
  @override
  Future<Either<Failure, List<Article>>> fetchNewsFeeds(String source) async {
    return Task(
      () => httpClientService.request<List<Article>>(
        apiUrl: Constants.aoiUrl,
        parameters: {'source': source, 'apiKey': Constants.aoiKey},
        mapper: (http.Response response) {
          final articles = <Article>[];
          final data = jsonDecode(response.body);
          for (final element in data['articles'] as List) {
            articles.add(Article.fromJson(element as Map<String, dynamic>));
          }
          return articles;
        },
      ),
    )
        .attempt()
        .map(
          (either) => either.leftMap((obj) {
            try {
              return obj as Failure;
            } catch (e) {
              throw obj;
            }
          }),
        )
        .run();
  }
}
