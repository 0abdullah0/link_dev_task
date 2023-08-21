import 'package:dartz/dartz.dart';
import 'package:link_dev_task/app/data/helpers/failure.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';
import 'package:link_dev_task/app/utils/usecase.dart';

class FetchAssociatedPress implements UseCase<List<Article>, NoParams> {
  FetchAssociatedPress(this.homeRepository);
  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) async {
    return homeRepository.fetchNewsFeeds('associated-press');
  }
}
