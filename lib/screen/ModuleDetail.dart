import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:canvas_lms/widgets/ModulePageDetail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ModuleDetail extends StatelessWidget {
  ModuleItems item;
  ModuleDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.title, style: TextStyle(fontSize: 12.0.sp)),
              Divider(),
              ModulePageDetail(url: item.url)
            ],
          )),
    );
  }
}
