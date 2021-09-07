part of 'uploadfile_bloc.dart';

@immutable
abstract class UploadfileEvent {}

class UploadImageEvent extends UploadfileEvent {}

class UploadDocEvent extends UploadfileEvent {}

class UploadVideoEvent extends UploadfileEvent {}

class PostDataEvent extends UploadfileEvent {
  final String title;
  final String subject;
  final String imagepath;
  final String videopath;
  final String docpath;
  PostDataEvent(
      this.title, this.subject, this.imagepath, this.videopath, this.docpath);
}
