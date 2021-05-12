import 'package:canvas_lms/model/Course.dart';
import 'package:canvas_lms/screen/CourseDetails.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CourseList extends StatelessWidget {
  final Course item;

  const CourseList({@required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseDetails(this.item)));
      },
      child: Card(
          elevation: 2, //shadown
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(fontSize: 8.0.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  item.category,
                  style: TextStyle(fontSize: 5.0.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )),
    );
  }
}
