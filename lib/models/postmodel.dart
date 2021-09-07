class PostModel {
  Data data;
  String message;
  List<String> errors;
  String statusCode;

  PostModel({this.data, this.message, this.errors, this.statusCode});

  PostModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    errors = json['errors'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  String title;
  String subject;
  String updatedAt;
  String createdAt;
  int id;
  List<Medias> medias;

  Data(
      {this.title,
      this.subject,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.medias});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subject = json['subject'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json['medias'] != null) {
      medias = new List<Medias>();
      json['medias'].forEach((v) {
        medias.add(new Medias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subject'] = this.subject;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.medias != null) {
      data['medias'] = this.medias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medias {
  int id;
  String flutterTaskId;
  String media;
  String type;
  String createdAt;
  String updatedAt;

  Medias(
      {this.id,
      this.flutterTaskId,
      this.media,
      this.type,
      this.createdAt,
      this.updatedAt});

  Medias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flutterTaskId = json['flutter_task_id'];
    media = json['media'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flutter_task_id'] = this.flutterTaskId;
    data['media'] = this.media;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
