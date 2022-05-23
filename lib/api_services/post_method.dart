import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:odc_project/model/register_response_model.dart';
import 'package:odc_project/utilites/my_strings.dart';

class PostMethods {
  Future<RegisterResponseModel> postMethod({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    var response = await http.post(Uri.parse(url), body: data);
    var RespnseBody = jsonDecode(response.body);
    RegisterResponseModel responseModel = RegisterResponseModel.fromJson(RespnseBody);
    return responseModel;
  }

  // Future register() async {
  //   var headers = {
  //     'Authorization':
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImlhdCI6MTY1MzMyNTA3MiwiZXhwIjoxNjUzMzI4NjcyfQ.xUvdJrvmQs0XdE1YBFXfeebcWZl4gsWThHZEVu0YgMM',
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST',
  //       Uri.parse(baseUrl+'/register'));
  //   request.body = json.encode({
  //     "name": "Mohammed ahmed",
  //     "email": "test@gmail.com",
  //     "password": "Hemalove1111",
  //     "phone": "01267546303",
  //     "address": "Egypt cairo tower "
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
