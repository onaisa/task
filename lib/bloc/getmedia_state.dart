part of 'getmedia_bloc.dart';

@immutable
abstract class GetmediaState {}

class GetmediaInitial extends GetmediaState {}

/////get data Item

class GetDataItemLoadingState extends GetmediaState {}

class GetDataItemSuccessState extends GetmediaState {
  Data mydata;
  GetDataItemSuccessState(this.mydata);
}

class GetDataItemErrorState extends GetmediaState {
  final String error;
  GetDataItemErrorState(this.error);
}
