import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/DetailAsignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ModuleAsignmentDetail extends StatefulWidget {
  final String url;
  const ModuleAsignmentDetail({Key key, this.url}) : super(key: key);

  @override
  _ModuleAsignmentDetailState createState() => _ModuleAsignmentDetailState();
}

class _ModuleAsignmentDetailState extends State<ModuleAsignmentDetail> {
  HttpService httpService = HttpService();
  Future<DetailAsignment> detailAsignmentPage;

  @override
  void initState() {
    detailAsignmentPage = httpService.getAsignmentModule(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailAsignment>(
      future: detailAsignmentPage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: HtmlWidget("${snapshot.data.description}"),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
