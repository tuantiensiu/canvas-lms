import 'dart:convert';
import 'package:canvas_lms/model/CalendarEvent.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpCalendar {
  String token =
      '2429~AL5SK3q7WFyKfctlIpxt9QBMemvJv3BM0287UzxR7sox8Z2EgDUIjbPnjAVwVEbf';

  Future<List<CalendarEvent>> getCalendarEvent() async {
    final parameter = {
      'type': 'assignment',
      'all_events': true,
      'context_codes': 'course_9676'
    };
    final res = await http.get(
      Uri.https(
          'masters.instructure.com', '/api/v1/calendar_events', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      print('object');
      List<dynamic> body = jsonDecode(res.body);
      List<CalendarEvent> calendarEvent = body
          .map(
            (dynamic item) => CalendarEvent.fromJson(item),
          )
          .toList();

      return calendarEvent;
    } else {
      print(res.statusCode);

      throw "Unable to retrieve posts.";
    }
  }
}
