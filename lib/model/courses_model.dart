class CoursesModel {
  bool? success;
  String? message;
  List<CourseData>? data;

  CoursesModel({this.success, this.message, this.data});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CourseData>[];
      json['data'].forEach((v) {
        data!.add(new CourseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseData {
  int? id;
  String? courseName;
  String? courseLevel;
  int? enrollable;
  int? entryExamId;
  int? exam1;
  int? exam2;
  int? exam3;
  int? finalProject;
  String? createdAt;
  Category? category;
  Admin? admin;

  CourseData(
      {this.id,
        this.courseName,
        this.courseLevel,
        this.enrollable,
        this.entryExamId,
        this.exam1,
        this.exam2,
        this.exam3,
        this.finalProject,
        this.createdAt,
        this.category,
        this.admin});

  CourseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
    enrollable = json['enrollable'];
    entryExamId = json['entryExamId'];
    exam1 = json['exam1'];
    exam2 = json['exam2'];
    exam3 = json['exam3'];
    finalProject = json['finalProject'];
    createdAt = json['createdAt'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    admin = json['Admin'] != null ? new Admin.fromJson(json['Admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['course_level'] = this.courseLevel;
    data['enrollable'] = this.enrollable;
    data['entryExamId'] = this.entryExamId;
    data['exam1'] = this.exam1;
    data['exam2'] = this.exam2;
    data['exam3'] = this.exam3;
    data['finalProject'] = this.finalProject;
    data['createdAt'] = this.createdAt;
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    if (this.admin != null) {
      data['Admin'] = this.admin!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? imageUrl;

  Category({this.id, this.categoryName, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Admin {
  String? adminName;
  String? email;

  Admin({this.adminName, this.email});

  Admin.fromJson(Map<String, dynamic> json) {
    adminName = json['admin_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_name'] = this.adminName;
    data['email'] = this.email;
    return data;
  }
}
