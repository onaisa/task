part of 'uploadfile_bloc.dart';

@immutable
abstract class UploadfileEvent {}

class UploadImageEvent extends UploadfileEvent {}

class UploadDocEvent extends UploadfileEvent {}

class UploadVideoEvent extends UploadfileEvent {}

class PostDataEvent extends UploadfileEvent {
  final String title;
  final String subject;

  PostDataEvent(
    this.title,
    this.subject,
  );
}
