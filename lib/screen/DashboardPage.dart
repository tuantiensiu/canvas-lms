import 'package:canvas_lms/screen/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:canvas_lms/main.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/',
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Danh sách khóa học', style: TextStyle(fontSize: 14.0.sp)),
              Divider(),
              Expanded(child: DashboardScreen())
            ],
          )),
    );
  }
}
