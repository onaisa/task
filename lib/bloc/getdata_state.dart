part of 'getdata_bloc.dart';

@immutable
abstract class GetdataState {}

class GetdataInitial extends GetdataState {}

/////get all data
class GetAllDataLoadingState extends GetdataState {}

class GetAllDataSuccessState extends GetdataState {
  final GetModel getModel;
  GetAllDataSuccessState(this.getModel);
}

class GetAllDataErrorState extends GetdataState {
  final String error;
  GetAllDataErrorState(this.error);
}
