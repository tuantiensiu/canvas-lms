import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/model/CalendarEvent.dart';
import 'package:canvas_lms/model/Courses.dart';
import 'package:canvas_lms/model/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class CourseDetails extends StatelessWidget {
  final Dashboard item;

  CourseDetails(this.item);
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    httpService.getCalendarEvent(item.assetString);
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
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Modules',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 20.0),
                    ExpansionTile(
                      title: Text(
                        "BTS510 LAND OF THE BIBLE",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Text('ARC Online Tutoring'),
                            subtitle: Text('KKKK'),
                            leading: Icon(Icons.location_city),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      FullScreenDialog(),
                                  fullscreenDialog: true,
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ModuleDetail()),
                              // );
                            }),
                        ListTile(
                          title: Text('Canvas Orientation'),
                          subtitle: Text('KKKK'),
                          leading: Icon(Icons.location_city),
                          onTap: () {
                            print('object');
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        "BTS510: module 1",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('ARC Online Tutoring'),
                          subtitle: Text('KKKK'),
                          leading: Icon(Icons.location_city),
                          onTap: () {
                            print('object');
                          },
                        ),
                        ListTile(
                          title: Text('Canvas Orientation'),
                          subtitle: Text('KKKK'),
                          leading: Icon(Icons.location_city),
                          onTap: () {
                            print('object');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
    // return FutureBuilder(
    //   future: httpService.getCalendarEvent(item.id),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<List<CalendarEvent>> snapshot) {
    //     if (snapshot.hasData) {
    //       List<CalendarEvent> calendarEvent = snapshot.data;
    //       // retyrb
    //     } else {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
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
