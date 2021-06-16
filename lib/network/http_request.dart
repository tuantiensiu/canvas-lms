import 'dart:convert';
import 'package:canvas_lms/model/Course.dart';
import 'package:canvas_lms/model/Courses.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  String token =
      '2429~C80kUFp1PQ5ghFSFoe6PyabIx51QRaesLrRCVareSrRRoBF3lLpvYm32GMA8v8nQ';

  final parameter = {
    'enrollment_type': 'teacher',
  };
  Future<List<Courses>> getPosts() async {
    final res = await http.get(
      Uri.https('masters.instructure.com', '/api/v1/courses', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(jsonDecode(res.body));
      List<Courses> course = body
          .map(
            (dynamic item) => Courses.fromJson(item),
          )
          .toList();

      return course;
    } else {
      print(res.statusCode);

      throw "Unable to retrieve posts.";
    }
  }
}
