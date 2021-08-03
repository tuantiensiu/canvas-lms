import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/DetailPage.dart';
import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ModulePageDetail extends StatefulWidget {
  final String url;

  const ModulePageDetail({Key key, this.url}) : super(key: key);

  @override
  _ModulePageDetailState createState() => _ModulePageDetailState();
}

class _ModulePageDetailState extends State<ModulePageDetail> {
  HttpService httpService = HttpService();
  Future<DetailPage> detailPage;

  @override
  void initState() {
    detailPage = httpService.getPageModule(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailPage>(
      future: detailPage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Html(
              data: snapshot.data.body,
              style: {},
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
