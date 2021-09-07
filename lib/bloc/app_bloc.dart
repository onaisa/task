import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_onaisa/models/getmodel.dart';
import 'package:task_onaisa/models/postmodel.dart';
import 'package:task_onaisa/service/services.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());
  DioService dioService = DioService();
  PostModel postModel;
  static AppBloc get(context) => BlocProvider.of(context);

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is PostDataEvent) {
      try {
        yield (PostDataLodingState());
        // var result = await DioService.getData();
        // GetModel getModel = GetModel.fromJson(result.data);
        // print(result.toString());

        Response result = await DioService.postData(
            title: event.title,
            subject: event.subject,
            docpath: event.docpath,
            imagepath: event.imagepath,
            videopath: event.videopath);
        // if()
        // postModel = PostModel.fromJson(result.data);
        print(result.statusMessage.toString());

        yield (PostDataSuccessState(postModel));
      } catch (e) {
        print(e.toString());
        yield (PostDataErrorState(e.toString()));
      }
    }
  }
}
