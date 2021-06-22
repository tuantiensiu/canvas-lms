import 'dart:convert';
import 'package:canvas_lms/model/Course.dart';
import 'package:canvas_lms/model/Courses.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  String token =
      '2429~AL5SK3q7WFyKfctlIpxt9QBMemvJv3BM0287UzxR7sox8Z2EgDUIjbPnjAVwVEbf';
  static const String domain = 'masters.instructure.com';
  Future<List<Courses>> getCourse() async {
    final parameter = {
      'enrollment_type': 'teacher',
    };
    final res = await http.get(
      Uri.https(domain, '/api/v1/courses', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
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
