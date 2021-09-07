import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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

  static Future<PostModel> postData({
    @required String title,
    @required String subject,
    @required String imagepath,
    @required String videopath,
    @required String docpath,
  }) async {
    var formData = FormData.fromMap({
      'tilte': title,
      'subject': subject,
      'photo': await MultipartFile.fromFile(imagepath,
          filename: imagepath.split("/").last,
          contentType: MediaType('photo', imagepath.split("/").last)),
      'video': await MultipartFile.fromFile(
        videopath,
        filename: videopath.split("/").last,
        contentType: MediaType('video', videopath.split("/").last),
      ),
      'doc': await MultipartFile.fromFile(
        docpath,
        filename: docpath.split("/").last,
        contentType: MediaType('file', docpath.split("/").last),
      ),
    });
    var response = await dio.post<dynamic>("/store-blog-flutter-task",
        data: formData,
        options: Options(
            headers: {"Accept": "*/*", "Content-Type": "multipart/form-data"}));
  }

  static Future<Response> getData() async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(GetEndPoint);
  }
}
