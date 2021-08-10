import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/DetailPage.dart';
import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
            padding: EdgeInsets.all(10.0),
            child: HtmlWidget(
              // "${snapshot.data.body}",
              '''
                 <video width="320" height="240" controls>
                  <source src="assets/videos/chuongtrinhnhom7.mp4" type="video/mp4">
                  Your browser does not support the video tag.
                </video>
              ''',
              webView: true,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
