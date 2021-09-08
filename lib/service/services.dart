import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:task_onaisa/models/getmodel.dart';
import 'package:task_onaisa/models/itemmodel.dart';
import 'package:task_onaisa/models/postmodel.dart';
import 'package:task_onaisa/ui/widgets/constance.dart';
import 'package:http_parser/http_parser.dart';

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
        baseUrl: "http://58one54zero.joybox-me.com/api",
        receiveDataWhenStatusError: true,
      ),
    );
  }

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
      // 'files': [
      //   await MultipartFile.fromFile(
      //     imagepath,
      //     filename: basename(imagepath),
      //   ),
      //   MultipartFile.fromFileSync(
      //     videopath,
      //     filename: basename(videopath),
      //   ),
      //   MultipartFile.fromFileSync(
      //     docpath,
      //     filename: basename(docpath),
      //   ),
      // ],
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
    // dio.options.contentType = Headers.formUrlEncodedContentType;

    Response response = await dio.post<dynamic>(
      "/store-blog-flutter-task",
      data: formData,
      options: Options(headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "multipart/form-data",
      }),
    );
    return response;
  }

  static Future<Response<String>> getData() async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get("/blogs-flutter-task");
  }

  static Future<Response<Map>> getDataItem({int id}) async {
    dio.options.headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    return await dio.get("/blogs-flutter-task?id=$id");
  }
}
