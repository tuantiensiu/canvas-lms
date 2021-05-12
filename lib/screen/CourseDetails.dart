import 'package:canvas_lms/model/Course.dart';
import 'package:canvas_lms/screen/ModuleDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class CourseDetails extends StatelessWidget {
  final Course item;

  CourseDetails(this.item);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(item.name.toUpperCase()),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
                Text(
                  item.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Container(
                  child: Text(item.content),
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
                                MaterialPageRoute(
                                    builder: (context) => ModuleDetail()),
                              );
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
            // Container(
            //   child: Image.asset(
            //     item.imageUrl,
            //   ),
            // ),
            // Image.asset(
            //   item.imageUrl,
            //   alignment: Alignment.center,
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.fitWidth,
            // ),
          ],
        ),
      ),
    );
  }
}
