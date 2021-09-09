import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_onaisa/models/itemmodel.dart';
import 'package:task_onaisa/service/diosevice.dart';

part 'getmedia_event.dart';
part 'getmedia_state.dart';

class GetmediaBloc extends Bloc<GetmediaEvent, GetmediaState> {
  GetmediaBloc() : super(GetmediaInitial());
  double currentindex = 0.0;
  ItemModel itemModel;
  static GetmediaBloc get(context) => BlocProvider.of(context);

  @override
  Stream<GetmediaState> mapEventToState(
    GetmediaEvent event,
  ) async* {
    if (event is GetMediaItemEvent) {
      try {
        yield (GetmediaLoudingState());
        var result = await DioService.getDataItem(id: event.id);
        print(result.statusCode);
        itemModel = ItemModel.fromJson(result.data);
        yield (GetmediaSuccessState(itemModel));
      } catch (e) {
        print(e.toString());
        yield (GetmediaErrorState());
      }
    }

    if (event is ChangecurrentIndexEvent) {
      try {
        currentindex = event.index.toDouble();
        yield (ChangeCurrentSuccessState());
        yield (GetmediaSuccessState(itemModel));
      } catch (e) {
        print(e.toString());
        yield (ChangCurrentErrorState());
      }
    }
  }
}
