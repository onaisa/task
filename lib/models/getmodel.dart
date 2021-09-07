class GetModel {
  List<Data> data;
  String message;
  List<String> errors;
  String statusCode;

  GetModel({this.data, this.message, this.errors, this.statusCode});

  GetModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    errors = json['errors'];
    // if (json['errors'] != null) {

    //   json['errors'].forEach((v) {
    //     errors.add(new String.fromJson(v));
    //   });
    // }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    // if (this.errors != null) {
    //   data['errors'] = this.errors.map((v) => v.toJson()).toList();
    // }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  int id;
  String title;
  String subject;
  String createdAt;
  String updatedAt;
  List<Medias> medias;

  Data(
      {this.id,
      this.title,
      this.subject,
      this.createdAt,
      this.updatedAt,
      this.medias});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subject = json['subject'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['medias'] != null) {
      json['medias'].forEach((v) {
        medias.add(new Medias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subject'] = this.subject;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
