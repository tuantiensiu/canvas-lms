import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/model/CalendarEvent.dart';
import 'package:canvas_lms/model/Dashboard.dart';
import 'package:canvas_lms/model/Modules.dart';
import 'package:canvas_lms/widgets/ListModules.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class CourseDetails extends StatelessWidget {
  final Dashboard item;

  CourseDetails(this.item);
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getListModule(item.id),
      builder: (BuildContext context, AsyncSnapshot<List<Modules>> snapshot) {
        if (snapshot.hasData) {
          List<Modules> modules = snapshot.data;
          return new Scaffold(
            appBar: AppBar(
              title: Text(item.shortName.toUpperCase()),
            ),
            body: Container(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset(
                          'assets/images/course_card.png',
                        ),
                      ),
                      Text(
                        item.shortName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Container(
                        child: Text(item.shortName),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                      Column(
                        children: modules
                            .map(
                              (Modules) =>
                                  ListModule(item: Modules, courseId: item),
                            )
                            .toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text('Full-screen Dialog'),
      ),
      body: Container(
          child: RaisedButton(
        onPressed: _launchURL,
        child: Text('data'),
      )),
    );
  }
}

void _launchURL() async => await canLaunch(_url)
    ? await launch(
        _url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )
    : throw 'Could not launch $_url';
