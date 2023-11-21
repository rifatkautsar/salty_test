part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<UserData> userModel;

  HomePageLoaded({required this.userModel});
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError({required this.message});
}
