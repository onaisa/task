part of 'uploadfile_bloc.dart';

@immutable
abstract class UploadfileState {}

class UploadfileInitial extends UploadfileState {}

/// upload image
class UploadImageLodingState extends UploadfileState {}

class UploadImageSUcessState extends UploadfileState {
  File image;
  UploadImageSUcessState(this.image);
}

class UploadImageErrorState extends UploadfileState {}

/// upload video
class UploadVideoLodingState extends UploadfileState {}

class UploadVideoSUcessState extends UploadfileState {
  File Video;
  UploadVideoSUcessState(this.Video);
}

class UploadVideoErrorState extends UploadfileState {}

/// upload doc
class UploadDocLodingState extends UploadfileState {}

class UploadDocSUcessState extends UploadfileState {
  File Doc;
  UploadDocSUcessState(this.Doc);
}

class UploadDocErrorState extends UploadfileState {}

/// post data
class PostDataLodingState extends UploadfileState {}

class PostDataErrorState extends UploadfileState {
  final String error;
  PostDataErrorState(this.error);
}

class PostDataSuccessState extends UploadfileState {
  final PostModel postModel;
  PostDataSuccessState(this.postModel);
}
