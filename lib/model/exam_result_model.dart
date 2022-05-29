class ExamResultModel {
  bool? success;
  String? message;
  Data? data;

  ExamResultModel({this.success, this.message, this.data});

  ExamResultModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userMark;
  String? status;

  Data({this.userMark, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    userMark = json['userMark'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userMark'] = this.userMark;
    data['status'] = this.status;
    return data;
  }
}
