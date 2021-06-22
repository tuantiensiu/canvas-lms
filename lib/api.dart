import 'dart:convert';
import 'package:canvas_lms/model/Courses.dart';
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

  Future<List<CalendarEvent>> getCalendarEvent(int courseId) async {
    final parameter = {
      'type': 'assignment',
      'all_events': 1,
      'context_codes': 'course_$courseId',
      'per_page': 50,
      'excludes': 'assignment',
    };
    final res = await http.get(
      Uri.https(domain, '/api/v1/calendar_events', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(res.body);
      List<CalendarEvent> calendarEvent = body
          .map(
            (dynamic item) => CalendarEvent.fromJson(item),
          )
          .toList();
      print(calendarEvent);
      return calendarEvent;
    } else {
      throw "Failed to load Calendar Event";
    }
  }
}
