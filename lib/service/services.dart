import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:http_parser/http_parser.dart';
import 'package:task_onaisa/ui/widgets/constance.dart';

class FileService {
  Future<File> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return null;
    return File(result.paths.first);
  }

  Future<File> pickDoc() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result == null) return null;
    return File(result.paths.first);
  }

  Future<File> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result == null) return null;
    return File(result.paths.first);
  }
}

class DioService {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  /// post data

  static Future<dynamic> postData({
    @required String title,
    @required String subject,
    @required String imagepath,
    @required String videopath,
    @required String docpath,
  }) async {
    FormData formData = new FormData.fromMap({
      'tilte': title,
      'subject': subject,
      'photo': await MultipartFile.fromFile(
        imagepath,
        filename: basename(imagepath),
        contentType: MediaType('photo', basename(imagepath)),
      ),
      'video': await MultipartFile.fromFile(
        videopath,
        filename: basename(videopath),
        contentType: MediaType('video', basename(videopath)),
      ),
      'doc': await MultipartFile.fromFile(
        docpath,
        filename: basename(docpath),
        contentType: MediaType('file', basename(docpath)),
      ),
    });

    Response response = await dio.post<dynamic>(
      postEndPoint,
      data: formData,
      options: Options(headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
      }),
    );
    return response;
  }

  ///get all data

  static Future<Response<String>> getData() async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(GetEndPoint);
  }

  ///get data item
  static Future<Response<Map>> getDataItem({int id}) async {
    dio.options.headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    return await dio.get("/blogs-flutter-task?id=$id");
  }
}
