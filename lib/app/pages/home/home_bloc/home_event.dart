part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

final class NewsFeedsFetched extends HomeEvent {
  @override
  List<Object> get props => [];
}
