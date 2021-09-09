part of 'uploadfile_bloc.dart';

@immutable
abstract class UploadfileState {}

class UploadfileInitial extends UploadfileState {}

/// upload image
class UploadImageLodingState extends UploadfileState {}

class UploadImageSUcessState extends UploadfileState {
  final String imagepath;
  UploadImageSUcessState(this.imagepath);
}

class UploadImageErrorState extends UploadfileState {}

/// upload video
class UploadVideoLodingState extends UploadfileState {}

class UploadVideoSUcessState extends UploadfileState {
  final String videopath;
  UploadVideoSUcessState(this.videopath);
}

class UploadVideoErrorState extends UploadfileState {}

/// upload doc
class UploadDocLodingState extends UploadfileState {}

class UploadDocSUcessState extends UploadfileState {
  final String docpath;
  UploadDocSUcessState(this.docpath);
}

class UploadDocErrorState extends UploadfileState {}

/// post data
class PostDataLodingState extends UploadfileState {}

class PostDataErrorState extends UploadfileState {
  final String error;
  PostDataErrorState(this.error);
}

class PostDataSuccessState extends UploadfileState {}
