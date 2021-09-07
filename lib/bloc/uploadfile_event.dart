part of 'uploadfile_bloc.dart';

@immutable
abstract class UploadfileEvent {}

class UploadImageEvent extends UploadfileEvent {}

class UploadDocEvent extends UploadfileEvent {}

class UploadVideoEvent extends UploadfileEvent {}
