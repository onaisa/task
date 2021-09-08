// // To parse this JSON data, do
// //
// //     final itemModel = itemModelFromJson(jsonString);

// import 'dart:convert';

// ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

// // String itemModelToJson(ItemModel data) => json.encode(data.toJson());

// class ItemModel {
//   ItemModel({
//     this.data,
//     // this.message,
//     // this.errors,
//     // this.statusCode,
//   });

//   Data data;
//   // String message;
//   // List<dynamic> errors;
//   // String statusCode;

//   factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
//         data: Data.fromJson(json["data"]),
//         // message: json["message"],
//         // errors: List<dynamic>.from(json["errors"].map((x) => x)),
//         // statusCode: json["status_code"],
//       );

//   // Map<String, dynamic> toJson() => {
//   //     "data": data.toJson(),
//   //     "message": message,
//   //     "errors": List<dynamic>.from(errors.map((x) => x)),
//   //     "status_code": statusCode,
//   // };
// }

// class Data {
//   Data({
//     this.id,
//     this.title,
//     this.subject,
//     this.createdAt,
//     this.updatedAt,
//     // this.medias,
//   });

//   int id;
//   String title;
//   String subject;
//   DateTime createdAt;
//   DateTime updatedAt;
//   // List<Media> medias;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         title: json["title"],
//         subject: json["subject"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         // medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
//       );

//   // Map<String, dynamic> toJson() => {
//   //     "id": id,
//   //     "title": title,
//   //     "subject": subject,
//   //     "created_at": createdAt.toIso8601String(),
//   //     "updated_at": updatedAt.toIso8601String(),
//   //     "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
//   // };
// }

// // class Media {
// //   Media({
// //     this.id,
// //     this.flutterTaskId,
// //     this.media,
// //     this.type,
// //     this.createdAt,
// //     this.updatedAt,
// //   });

// //   int id;
// //   String flutterTaskId;
// //   String media;
// //   String type;
// //   DateTime createdAt;
// //   DateTime updatedAt;

// //   factory Media.fromJson(Map<String, dynamic> json) => Media(
// //         id: json["id"],
// //         flutterTaskId: json["flutter_task_id"],
// //         media: json["media"],
// //         type: json["type"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //       );

//   // Map<String, dynamic> toJson() => {
//   //     "id": id,
//   //     "flutter_task_id": flutterTaskId,
//   //     "media": media,
//   //     "type": type,
//   //     "created_at": createdAt.toIso8601String(),
//   //     "updated_at": updatedAt.toIso8601String(),
//   // };
// // }




















































