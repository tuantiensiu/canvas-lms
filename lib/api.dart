import 'dart:convert';
import 'package:canvas_lms/modal/Dashboard.dart';
import 'package:canvas_lms/modal/DetailAsignment.dart';
import 'package:canvas_lms/modal/DetailFile.dart';
import 'package:canvas_lms/modal/DetailPage.dart';
import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:canvas_lms/modal/Modules.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:canvas_lms/modal/CalendarEvent.dart';

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
      Uri.https(domain, '/api/v1/courses/$courseId/modules/$moduleId/items'),
      headers: header,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ModuleItems> data = body
          .map(
            (dynamic item) => ModuleItems.fromJson(item),
          )
          .toList();
      return data;
    } else {
      throw "Failed to load list modules item";
    }
  }

  Future<DetailPage> getPageModule(String url) async {
    final res = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (res.statusCode == 200) {
      return DetailPage.fromJson(jsonDecode(res.body));
    } else {
      throw "Failed to load getPageModule";
    }
  }

  Future<DetailAsignment> getAsignmentModule(String url) async {
    final res = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (res.statusCode == 200) {
      return DetailAsignment.fromJson(jsonDecode(res.body));
    } else {
      throw "Failed to load getAsignmentModule";
    }
  }

  Future<DetailFile> getFileModule(String url) async {
    final res = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (res.statusCode == 200) {
      return DetailFile.fromJson(jsonDecode(res.body));
    } else {
      throw "Failed to load DetailFile";
    }
  }
}
