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
