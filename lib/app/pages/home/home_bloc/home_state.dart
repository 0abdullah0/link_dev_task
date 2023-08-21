part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class NewsFeedsLoadInProgress extends HomeState {
  @override
  List<Object> get props => [];
}

final class NewsFeedsLoadSuccess extends HomeState {
  const NewsFeedsLoadSuccess(this.articles);
  final List<Article> articles;
  @override
  List<Object> get props => [articles];
}

final class NewsFeedsLoadFailure extends HomeState {
  const NewsFeedsLoadFailure(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
