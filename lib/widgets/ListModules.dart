import 'package:canvas_lms/model/CalendarEvent.dart';
import 'package:canvas_lms/model/Modules.dart';
import 'package:flutter/material.dart';

class ListModule extends StatelessWidget {
  final Modules item;
  const ListModule({@required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        item.name,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                  builder: (BuildContext context) => FullScreenDialog(),
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
        onPressed: () {},
        child: Text('data'),
      )),
    );
  }
}
