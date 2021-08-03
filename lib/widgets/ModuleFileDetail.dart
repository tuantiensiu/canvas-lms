import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/DetailFile.dart';
import 'package:flutter/material.dart';

class ModuleFileDetail extends StatefulWidget {
  final String url;
  const ModuleFileDetail({Key key, this.url}) : super(key: key);

  @override
  _ModuleFileDetailState createState() => _ModuleFileDetailState();
}

class _ModuleFileDetailState extends State<ModuleFileDetail> {
  HttpService httpService = HttpService();
  Future<DetailFile> detailFile;

  @override
  void initState() {
    detailFile = httpService.getFileModule(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailFile>(
      future: detailFile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Text('weoirji'),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
