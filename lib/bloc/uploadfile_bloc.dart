import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:task_onaisa/models/postmodel.dart';
import 'package:task_onaisa/service/services.dart';

part 'uploadfile_event.dart';
part 'uploadfile_state.dart';

class UploadfileBloc extends Bloc<UploadfileEvent, UploadfileState> {
  UploadfileBloc() : super(UploadfileInitial());
  FileService servicesFile = FileService();
  DioService dioService = DioService();
  PostModel postModel;
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

        yield UploadImageSUcessState(image);
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

        yield UploadVideoSUcessState(video);
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

        yield UploadDocSUcessState(doc);
      } catch (e) {
        print(e.toString());
        yield UploadDocErrorState();
      }
    }

    if (event is PostDataEvent) {
      yield (PostDataLodingState());
      try {
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
