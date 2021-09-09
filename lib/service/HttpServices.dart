import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Httphilper {
  static Future<http.StreamedResponse> postData({
    String title,
    @required String subject,
    @required String imagepath,
    @required String videopath,
    @required String docpath,
  }) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://58one54zero.joybox-me.com/api/store-blog-flutter-task'));
    request.fields.addAll({'title': title, 'subject': subject});
    request.files.add(await http.MultipartFile.fromPath('photo', imagepath));
    request.files.add(await http.MultipartFile.fromPath('doc', docpath));
    request.files.add(await http.MultipartFile.fromPath('video', videopath));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.statusCode);
    }
    return response;
  }
}
