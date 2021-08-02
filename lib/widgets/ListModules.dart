import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/CalendarEvent.dart';
import 'package:canvas_lms/modal/Dashboard.dart';
import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:canvas_lms/modal/Modules.dart';
import 'package:canvas_lms/widgets/ListModuleItems.dart';
import 'package:flutter/material.dart';

class ListModule extends StatelessWidget {
  final Modules item;
  final Dashboard courseId;
  ListModule({@required this.item, @required this.courseId});

  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getListModuleItem(courseId.id, item.id),
      builder:
          (BuildContext context, AsyncSnapshot<List<ModuleItems>> snapshot) {
        if (snapshot.hasData) {
          List<ModuleItems> modulesItem = snapshot.data;
          return ExpansionTile(
            title: Text(
              item.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: modulesItem
                .map((ModuleItems) => ListModuleItems(item: ModuleItems))
                .toList(),
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
        onPressed: () {},
        child: Text('data'),
      )),
    );
  }
}
