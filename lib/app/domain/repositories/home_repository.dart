import 'package:dartz/dartz.dart';
import 'package:link_dev_task/app/data/helpers/failure.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';

// ignore: one_member_abstracts
abstract interface class HomeRepository {
  Future<Either<Failure, List<Article>>> fetchNewsFeeds(String source);
}
