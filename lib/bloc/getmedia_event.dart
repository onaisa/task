part of 'getmedia_bloc.dart';

@immutable
abstract class GetmediaEvent {}

class GetataItemEvent extends GetmediaEvent {
  final int id;
  GetataItemEvent(this.id);
}
