import 'package:canvas_lms/model/Course.dart';
import 'package:flutter/material.dart';

import 'CourseList.dart';

class DashboardScreen extends StatelessWidget {
  List<Course> itemCourse;
  @override
  Widget build(BuildContext context) {
    itemCourse = _itemCourse();
    return Expanded(
      child: _gridView(),
    );
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 1.1, // scale card
      children: itemCourse
          .map(
            (Course) => CourseList(item: Course),
          )
          .toList(),
    );
  }

  List<Course> _itemCourse() {
    return [
      Course(
          id: 0,
          name: 'The Lorem ipsum text is derived from sections rDe finibus ',
          category:
              'The Lorem ipsum text is derived from sections rDe finibus bonorum et malorum',
          imageUrl: 'imageUrl'),
      Course(
          id: 1,
          name: '1 Avengers: Infinity War 4',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
      Course(
          id: 2,
          name: 'Avengers: Infinity War 4',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
      Course(
          id: 3,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
      Course(
          id: 4,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
      Course(
          id: 5,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
      Course(
          id: 6,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          imageUrl: 'imageUrl'),
    ];
  }
}
