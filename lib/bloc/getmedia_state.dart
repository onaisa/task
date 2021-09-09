part of 'getmedia_bloc.dart';

@immutable
abstract class GetmediaState {}

class GetmediaInitial extends GetmediaState {}

class GetmediaLoudingState extends GetmediaState {}

class GetmediaSuccessState extends GetmediaState {
  final ItemModel itemModel;
  GetmediaSuccessState(this.itemModel);
}

class GetmediaErrorState extends GetmediaState {}
///// change currentindex

class ChangeCurrentSuccessState extends GetmediaState {
  // double currentIndex;
  // ChangeCurrentSuccessState(this.currentIndex);
}

class ChangCurrentErrorState extends GetmediaState {}
