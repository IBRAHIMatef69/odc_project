import 'package:odc_project/model/categories_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odc_project/model/courses_model.dart';
import 'package:odc_project/model/exam_model.dart';
import 'package:odc_project/utilites/my_strings.dart';

class GetMethods {
  ///getCategories
  Future<CategoriesModel> getCategoriesMethod(String refreshToken) async {
    var response = await http.get(Uri.parse(baseUrl + "categories"),
        headers: {"Authorization": 'Bearer ' + refreshToken});
    var responseBody = jsonDecode(response.body);

    CategoriesModel categoriesModel = CategoriesModel.fromJson(responseBody);
    return categoriesModel;
  }

  ///getAllCourses
  Future<CoursesModel> getAllCoursesMethod(String refreshToken) async {
    var response = await http.get(Uri.parse(baseUrl + "courses"),
        headers: {"Authorization": 'Bearer ' + refreshToken});
    var responseBody = jsonDecode(response.body);

    CoursesModel categoriesModel = CoursesModel.fromJson(responseBody);
    return categoriesModel;
  }
  ///get exam by code
  Future<ExamModel> getExamMethod(int examCode, String accessToken) async {
    var response = await http.get(
      Uri.parse(baseUrl + 'exams/$examCode'),
      headers: {"Authorization": 'Bearer ' + accessToken},
    );

    var responseBody = jsonDecode(response.body);
    ExamModel examModel=ExamModel.fromJson(responseBody);
    return examModel;
  }
}
