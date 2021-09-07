part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

/// post data
class PostDataLodingState extends AppState {}

class PostDataErrorState extends AppState {
  final String error;
  PostDataErrorState(this.error);
}

class PostDataSuccessState extends AppState {
  final PostModel postModel;
  PostDataSuccessState(this.postModel);
}
