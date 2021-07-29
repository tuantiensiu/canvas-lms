import 'dart:convert';
import 'package:canvas_lms/model/Dashboard.dart';
import 'package:canvas_lms/model/ModuleItems.dart';
import 'package:canvas_lms/model/Modules.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:canvas_lms/model/CalendarEvent.dart';

class HttpService {
  //HTTP fech data
  static const String token =
      '7~xhA9tZRo6uGx2wJrogblqOVlZlatnT0sWi2yP8391iBjcQxgtQFXzvoXMpEDe4Gl';
  static const String domain = 'canvas.instructure.com';
  var header = {
    HttpHeaders.authorizationHeader: 'Bearer $token',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future<List<Dashboard>> getDashboard() async {
    final res = await http.get(
      Uri.https(domain, '/api/v1/dashboard/dashboard_cards'),
      headers: header,
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
      throw "Failed to load Dashboard";
    }
  }

  Future<List<CalendarEvent>> getCalendarEvent(String courseId) async {
    Map<String, dynamic> parameter = {
      'type': 'assignment',
      'all_events': ['true'],
      'context_codes[]': '$courseId',
    };

    final res = await http.get(
      Uri.https(domain, '/api/v1/calendar_events', parameter),
      headers: header,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<CalendarEvent> calendar = body
          .map(
            (dynamic item) => CalendarEvent.fromJson(item),
          )
          .toList();
      return calendar;
    } else {
      throw "Failed to load detail calendar";
    }
  }

  Future<List<Modules>> getListModule(int courseId) async {
    final res = await http.get(
      Uri.https(domain, '/api/v1/courses/$courseId/modules'),
      headers: header,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Modules> module = body
          .map(
            (dynamic itemModule) => Modules.fromJson(itemModule),
          )
          .toList();
      return module;
    } else {
      throw "Failed to load list modules";
    }
  }

  Future<List<ModuleItems>> getListModuleItem(
      int courseId, int moduleId) async {
    final res = await http.get(
      Uri.https(domain, '/api/v1/courses/$courseId/modules/$moduleId'),
      headers: header,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ModuleItems> data = body
          .map(
            (dynamic itemModule) => ModuleItems.fromJson(itemModule),
          )
          .toList();
      return data;
    } else {
      throw "Failed to load list modules item";
    }
  }
}
