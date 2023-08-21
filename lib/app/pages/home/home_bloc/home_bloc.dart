// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_associated_press.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_next_web.dart';
import 'package:link_dev_task/app/utils/usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
    required this.fetchAssociatedPress,
    required this.fetchNextWeb,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is NewsFeedsFetched) {
        emit(NewsFeedsLoadInProgress());
        final articles = <Article>[];
        final failureOrArticles = await Future.wait([
          fetchNextWeb(NoParams()),
          fetchAssociatedPress(NoParams()),
        ]);

        failureOrArticles[0].fold(
          (failure) => emit(NewsFeedsLoadFailure(failure.message)),
          articles.addAll,
        );

        failureOrArticles[1].fold(
          (failure) => emit(NewsFeedsLoadFailure(failure.message)),
          articles.addAll,
        );
        if (failureOrArticles[0].isRight() && failureOrArticles[1].isRight()) {
          emit(NewsFeedsLoadSuccess(articles));
        }
      }
    });
  }
  final HomeRepository homeRepository;
  final FetchAssociatedPress fetchAssociatedPress;
  final FetchNextWeb fetchNextWeb;
}
