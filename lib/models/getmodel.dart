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
    this.medias,
  });

  int id;
  String title;
  String subject;
  DateTime createdAt;
  DateTime updatedAt;
  List<Media> medias;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subject: json["subject"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subject": subject,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "medias": List<Media>.from(medias.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    this.id,
    this.flutterTaskId,
    this.media,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String flutterTaskId;
  String media;
  Type type;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        flutterTaskId: json["flutter_task_id"],
        media: json["media"],
        type: typeValues.map[json["type"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flutter_task_id": flutterTaskId,
        "media": media,
        "type": typeValues.reverse[type],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Type { PHOTO, FILE, VIDEO }

final typeValues =
    EnumValues({"file": Type.FILE, "photo": Type.PHOTO, "video": Type.VIDEO});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}



















































































// class GetModel {
//   List<Data> dataModel;
//   String message;
//   List<String> errors;
//   String statusCode;

//   GetModel({this.dataModel, this.message, this.errors, this.statusCode});

//   GetModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       json['data'].forEach((v) {
//         dataModel.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//     errors = json['errors'];
//     // if (json['errors'] != null) {

//     //   json['errors'].forEach((v) {
//     //     errors.add(new String.fromJson(v));
//     //   });
//     // }
//     statusCode = json['status_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dataModel != null) {
//       data['data'] = this.dataModel.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     data['errors'] = this.errors;
//     // if (this.errors != null) {
//     //   data['errors'] = this.errors.map((v) => v.toJson()).toList();
//     // }
//     data['status_code'] = this.statusCode;
//     return data;
//   }
// }

// class Data {
//   int id;
//   String title;
//   String subject;
//   String createdAt;
//   String updatedAt;
//   List<Medias> medias;

//   Data(
//       {this.id,
//       this.title,
//       this.subject,
//       this.createdAt,
//       this.updatedAt,
//       this.medias});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     subject = json['subject'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['medias'] != null) {
//       json['medias'].forEach((v) {
//         medias.add(new Medias.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['subject'] = this.subject;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.medias != null) {
//       data['medias'] = this.medias.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Medias {
//   int id;
//   String flutterTaskId;
//   String media;
//   String type;
//   String createdAt;
//   String updatedAt;

//   Medias(
//       {this.id,
//       this.flutterTaskId,
//       this.media,
//       this.type,
//       this.createdAt,
//       this.updatedAt});

//   Medias.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     flutterTaskId = json['flutter_task_id'];
//     media = json['media'];
//     type = json['type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['flutter_task_id'] = this.flutterTaskId;
//     data['media'] = this.media;
//     data['type'] = this.type;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
