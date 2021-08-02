import 'package:canvas_lms/model/ModuleItems.dart';
import 'package:flutter/material.dart';

class ListModuleItems extends StatelessWidget {
  final ModuleItems item;
  const ListModuleItems({@required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(item.title),
        // subtitle: Text('KKKK'),
        leading: Icon(Icons.description_outlined),
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
        });
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
