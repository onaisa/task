// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

// String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.data,
    // this.message,
    // this.errors,
    // this.statusCode,
  });

  Data data;
  // String message;
  // List<dynamic> errors;
  // String statusCode;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        data: Data.fromJson(json["data"]),
        // message: json["message"],
        // errors: List<dynamic>.from(json["errors"].map((x) => x)),
        // statusCode: json["status_code"],
      );

  // Map<String, dynamic> toJson() => {
  //     "data": data.toJson(),
  //     "message": message,
  //     "errors": List<dynamic>.from(errors.map((x) => x)),
  //     "status_code": statusCode,
  // };
}

class Data {
  Data({
    this.id,
    this.title,
    this.subject,
    this.createdAt,
    this.updatedAt,
    // this.medias,
  });

  int id;
  String title;
  String subject;
  DateTime createdAt;
  DateTime updatedAt;
  // List<Media> medias;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        subject: json["subject"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "title": title,
  //     "subject": subject,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  //     "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
  // };
}

// class Media {
//   Media({
//     this.id,
//     this.flutterTaskId,
//     this.media,
//     this.type,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int id;
//   String flutterTaskId;
//   String media;
//   String type;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         id: json["id"],
//         flutterTaskId: json["flutter_task_id"],
//         media: json["media"],
//         type: json["type"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "flutter_task_id": flutterTaskId,
  //     "media": media,
  //     "type": type,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  // };
// }
































































// class ItemModel {
//   MyData data;
// // String message;
// // List<Null> errors;
// // String statusCode;

// ItemModel({
//   this.data,
// });

// ItemModel.fromJson(Map<String, dynamic> json) {
//   data = json['data'];}

// // if (json['errors'] != null) {
// //   errors = new List<Null>();
// //   json['errors'].forEach((v) {
// //     errors.add(new Null.fromJson(v));
// //   });
// // }
// // }

// // Map<String, dynamic> toJson() {/
// //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   if (this.data != null) {
// //     data['data'] = this.data.toJson();
// //   }
// //   data['message'] = this.message;
// //   // if (this.errors != null) {
// //   //   data['errors'] = this.errors.map((v) => v.toJson()).toList();
// //   // }
// //   data['status_code'] = this.statusCode;
// //   return data;
// // }
// // }

// class MyData {
//   int id;
//   String title;
//   String subject;
//   String createdAt;
//   String updatedAt;
//   List<MyMedia> medias;

//   MyData(
//       {this.id,
//       this.title,
//       this.subject,
//       this.createdAt,
//       this.updatedAt,
//       this.medias});

//   MyData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     subject = json['subject'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (medias != null) {
//       json['medias'].forEach((v) {
//         medias.add(new MyMedia.fromJson(v));
//       });
//     }
//   }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['subject'] = this.subject;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.medias != null) {
  //     data['medias'] = this.medias.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
// }

// class MyMedia {
//   int id;
//   String flutterTaskId;
//   String media;
//   String type;
//   String createdAt;
//   String updatedAt;

//   MyMedia(
//       {this.id,
//       this.flutterTaskId,
//       this.media,
//       this.type,
//       this.createdAt,
//       this.updatedAt});

//   MyMedia.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     flutterTaskId = json['flutter_task_id'];
//     media = json['media'];
//     type = json['type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['flutter_task_id'] = this.flutterTaskId;
  //   data['media'] = this.media;
  //   data['type'] = this.type;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
// }



























































































// // To parse this JSON data, do
// //
// //     final itemModel = itemModelFromJson(jsonString);

// import 'dart:convert';

// ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

// String itemModelToJson(ItemModel data) => json.encode(data.toJson());

// class ItemModel {
//   ItemModel({
//     this.data,
//     // this.message,
//     // this.errors,
//     // this.statusCode,
//   });

//   Data data;
//   // String message;
//   // List<String> errors;
//   // String statusCode;

//   factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
//         data: Data.fromJson(json["data"]),
//         // message: json["message"],
//         // errors: List<dynamic>.from(json["errors"].map((x) => x)),
//         // statusCode: json["status_code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//         // "message": message,
//         // "errors": List<dynamic>.from(errors.map((x) => x)),
//         // "status_code": statusCode,
//       };
// }

// class Data {
//   Data({
//     // this.id,
//     // this.title,
//     // this.subject,
//     // this.createdAt,
//     // this.updatedAt,
//     this.medias,
//   });

//   // int id;
//   // String title;
//   // String subject;
//   // DateTime createdAt;
//   // DateTime updatedAt;
//   List<Media> medias;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         // id: json["id"],
//         // title: json["title"],
//         // subject: json["subject"],
//         // createdAt: DateTime.parse(json["created_at"]),
//         // updatedAt: DateTime.parse(json["updated_at"]),
//         medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         // "id": id,
//         // "title": title,
//         // "subject": subject,
//         // "created_at": createdAt.toIso8601String(),
//         // "updated_at": updatedAt.toIso8601String(),
//         "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
//       };
// }

// class Media {
//   Media({
//     this.id,
//     this.flutterTaskId,
//     this.media,
//     this.type,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int id;
//   String flutterTaskId;
//   String media;
//   String type;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         id: json["id"],
//         flutterTaskId: json["flutter_task_id"],
//         media: json["media"],
//         type: json["type"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "flutter_task_id": flutterTaskId,
//         "media": media,
//         "type": type,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
