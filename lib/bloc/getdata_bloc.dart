import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_onaisa/models/getmodel.dart';
import 'package:task_onaisa/models/itemmodel.dart';
import 'package:task_onaisa/service/services.dart';

part 'getdata_event.dart';
part 'getdata_state.dart';

class GetdataBloc extends Bloc<GetdataEvent, GetdataState> {
  GetdataBloc() : super(GetdataInitial());
  DioService dioService = DioService();

  GetModel getModel;

  @override
  Stream<GetdataState> mapEventToState(
    GetdataEvent event,
  ) async* {
    if (event is GetAllDataEvent) {
      yield (GetAllDataLoadingState());

      try {
        Response resulte = await DioService.getData();
        getModel = GetModel.fromJson(jsonDecode(resulte.data));
        print(getModel.data[0].subject);
        print(resulte.statusCode);

        yield (GetAllDataSuccessState(getModel));
      } catch (e) {
        print(e.toString());
        yield (GetAllDataErrorState(e.toString()));
      }
    }
  }
}
