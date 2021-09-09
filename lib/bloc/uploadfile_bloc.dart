import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import 'package:task_onaisa/service/HttpServices.dart';
import 'package:task_onaisa/service/diosevice.dart';
import 'package:task_onaisa/service/services.dart';

part 'uploadfile_event.dart';
part 'uploadfile_state.dart';

class UploadfileBloc extends Bloc<UploadfileEvent, UploadfileState> {
  UploadfileBloc() : super(UploadfileInitial());
  FileService servicesFile = FileService();
  DioService dioService = DioService();

  File image;
  File video;
  File doc;

  @override
  Stream<UploadfileState> mapEventToState(
    UploadfileEvent event,
  ) async* {
    if (event is UploadImageEvent) {
      yield UploadImageLodingState();
      try {
        image = await servicesFile.pickImage();

        yield UploadImageSUcessState(image.path);
      } catch (e) {
        print(e.toString());
        yield UploadImageErrorState();
      }
    }
    /////
    if (event is UploadVideoEvent) {
      yield UploadVideoLodingState();
      try {
        video = await servicesFile.pickVideo();

        yield UploadVideoSUcessState(video.path);
      } catch (e) {
        print(e.toString());
        yield UploadVideoErrorState();
      }
    }
    /////
    if (event is UploadDocEvent) {
      yield UploadDocLodingState();
      try {
        doc = await servicesFile.pickDoc();

        yield UploadDocSUcessState(doc.path);
      } catch (e) {
        print(e.toString());
        yield UploadDocErrorState();
      }
    }

    if (event is PostDataEvent) {
      yield (PostDataLodingState());
      try {
        StreamedResponse result = await Httphilper.postData(
            title: event.title,
            subject: event.subject,
            docpath: doc.path,
            imagepath: image.path,
            videopath: video.path);

        print(result.statusCode);

        yield (PostDataSuccessState());
      } catch (e) {
        print(e.toString());
        yield (PostDataErrorState("no connect"));
      }
    }
  }
}
