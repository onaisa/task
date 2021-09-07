part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class PostDataEvent extends AppEvent {
  final String title;
  final String subject;
  final String imagepath;
  final String videopath;
  final String docpath;
  PostDataEvent(
      this.title, this.subject, this.imagepath, this.videopath, this.docpath);
}
