import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:task_onaisa/models/getmodel.dart';
import 'package:task_onaisa/models/itemmodel.dart';
import 'package:task_onaisa/models/postmodel.dart';
import 'package:task_onaisa/service/services.dart';

part 'getmedia_event.dart';
part 'getmedia_state.dart';

class GetmediaBloc extends Bloc<GetmediaEvent, GetmediaState> {
  GetmediaBloc() : super(GetmediaInitial());
  ItemModel itemModel;
  Data data;

  @override
  Stream<GetmediaState> mapEventToState(
    GetmediaEvent event,
  ) async* {
    if (event is GetataItemEvent) {
      yield (GetDataItemLoadingState());
      DioService.getDataItem(id: event.id).then((value) {
        itemModel =
            ItemModel.fromJson(jsonDecode(value.data.toString().substring(9)));
        print(itemModel.data.id);
        // emit(GetDataItemSuccessState(data));
      }).catchError((error) {
        print(error.toString());
        emit(GetDataItemErrorState(error.toString()));
      });

      // try {
      //   Response resulte = await DioService.getDataItem(id: event.id);

      //   itemModel = ItemModel.fromJson(jsonDecode(resulte.data.toString()));

      //   print(resulte.data);
      //   // print(itemModel.data.title);

      //   // yield (GetDataItemSuccessState(itemModel));
      // } catch (e) {
      //   print(e.toString());
      //   yield (GetDataItemErrorState(e.toString()));
      // }
    }
  }
}
