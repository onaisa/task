// To parse this JSON data, do
//
//     final getModel = getModelFromJson(jsonString);

import 'dart:convert';

GetModel getModelFromJson(String str) => GetModel.fromJson(json.decode(str));

String getModelToJson(GetModel data) => json.encode(data.toJson());

class GetModel {
  GetModel({
    this.data,
    this.message,
    this.errors,
    this.statusCode,
  });

  List<Datum> data;
  String message;
  List<dynamic> errors;
  String statusCode;

  factory GetModel.fromJson(Map<String, dynamic> json) => GetModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "status_code": statusCode,
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subject: json["subject"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subject": subject,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        // "medias": List<Media>.from(medias.map((x) => x.toJson())),
      };
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
//   Type type;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         id: json["id"],
//         flutterTaskId: json["flutter_task_id"],
//         media: json["media"],
//         type: typeValues.map[json["type"]],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "flutter_task_id": flutterTaskId,
//         "media": media,
//         "type": typeValues.reverse[type],
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// enum Type { PHOTO, FILE, VIDEO }

// final typeValues =
//     EnumValues({"file": Type.FILE, "photo": Type.PHOTO, "video": Type.VIDEO});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
