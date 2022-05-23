class RegisterResponseModel {
  bool? success;
  String? message;
  Data? data;

  RegisterResponseModel({this.success, this.message, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  Student? student;
  String? accessToken;
  String? refreshToken;

  Data({this.student, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}

class Student {
  int? id;
  String? studentName;
  String? email;
  String? passwordHash;
  String? studentPhone;
  String? studentAddress;
  String? updatedAt;
  String? createdAt;

  Student(
      {this.id,
        this.studentName,
        this.email,
        this.passwordHash,
        this.studentPhone,
        this.studentAddress,
        this.updatedAt,
        this.createdAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    studentPhone = json['student_phone'];
    studentAddress = json['student_address'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_name'] = this.studentName;
    data['email'] = this.email;
    data['passwordHash'] = this.passwordHash;
    data['student_phone'] = this.studentPhone;
    data['student_address'] = this.studentAddress;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
