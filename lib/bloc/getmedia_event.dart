part of 'getmedia_bloc.dart';

@immutable
abstract class GetmediaEvent {}

class GetMediaItemEvent extends GetmediaEvent {
  final int id;

  GetMediaItemEvent(this.id);
}

class ChangecurrentIndexEvent extends GetmediaEvent {
  int index;
  ChangecurrentIndexEvent(this.index);
}
