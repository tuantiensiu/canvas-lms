import 'dart:convert';
import 'package:canvas_lms/model/Courses.dart';
import 'package:canvas_lms/model/Dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:canvas_lms/model/CalendarEvent.dart';

class HttpService {
  //HTTP fech data
  static const String token =
      '2429~jSPYvbtjnCFXx6tOMjKJ96HoflZGjX23nUkoI0mIND2wO1Rx34q3rrWQrPzJ3VfI';
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

      throw "Failed to load Course";
    }
  }

  Future<List<Courses>> getCourse2() async {
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

      throw "Failed to load Course";
    }
  }

  Future<List<Dashboard>> getDashboard() async {
    final res = await http.get(
      Uri.https(domain, '/api/v1/dashboard/dashboard_cards'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Dashboard> dashboard = body
          .map(
            (dynamic item) => Dashboard.fromJson(item),
          )
          .toList();
      return dashboard;
    } else {
      print(res.statusCode);

      throw "Failed to load Dashboard";
    }
  }

  Future<List<CalendarEvent>> getCalendarEvent(String courseId) async {
    final parameter = {
      'type': 'assignment',
      'all_events': 1,
      'context_codes': '$courseId',
      'per_page': 50,
      'excludes': 'assignment',
    };
    print(parameter);
    print(courseId);
    final res = await http.get(
      Uri.https(domain, '/api/v1/calendar_events', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      print('2221414');
      List<dynamic> body = jsonDecode(res.body);
      print(res.body);
      List<CalendarEvent> calendarEvent = body
          .map(
            (dynamic item) => CalendarEvent.fromJson(item),
          )
          .toList();
      return calendarEvent;
    } else {
      throw "Failed to load Calendar Event";
    }
  }
}
