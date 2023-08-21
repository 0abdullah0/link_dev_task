import 'package:dartz/dartz.dart';
import 'package:link_dev_task/app/data/helpers/failure.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';
import 'package:link_dev_task/app/utils/usecase.dart';

class FetchNextWeb implements UseCase<List<Article>, NoParams> {
  FetchNextWeb(this.homeRepository);
  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) async {
    return homeRepository.fetchNewsFeeds('the-next-web');
  }
}
