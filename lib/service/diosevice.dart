import 'package:dio/dio.dart';
import 'package:task_onaisa/ui/widgets/constance.dart';

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

  // static Future<dynamic> postData({
  //   @required String title,
  //   @required String subject,
  //   @required String imagepath,
  //   @required String videopath,
  //   @required String docpath,
  // }) async {
  //   FormData formData = new FormData.fromMap({
  //     'tilte': title,
  //     'subject': subject,
  //     'photo': await MultipartFile.fromFile(
  //       imagepath,
  //       filename: basename(imagepath),
  //       contentType: MediaType('photo', basename(imagepath)),
  //     ),
  //     'video': await MultipartFile.fromFile(
  //       videopath,
  //       filename: basename(videopath),
  //       contentType: MediaType('video', basename(videopath)),
  //     ),
  //     'doc': await MultipartFile.fromFile(
  //       docpath,
  //       filename: basename(docpath),
  //       contentType: MediaType('file', basename(docpath)),
  //     ),
  //   });

  //   Response response = await dio.post<dynamic>(
  //     postEndPoint,
  //     data: formData,
  //     options: Options(headers: <String, String>{
  //       "Accept": "application/json",
  //       "Content-Type": "multipart/form-data",
  //     }),
  //   );
  //   return response;
  // }

  ///get all data

  static Future<Response<String>> getData() async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(GetEndPoint);
  }

  ///get data item
  static Future<Response> getDataItem({int id}) async {
    dio.options.headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    return await dio.get("/blog-flutter-task?id=$id");
  }
}
