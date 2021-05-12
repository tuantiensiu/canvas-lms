import 'package:canvas_lms/model/Course.dart';
import 'package:flutter/material.dart';

import 'CourseList.dart';

class DashboardScreen extends StatelessWidget {
  List<Course> itemCourse;
  @override
  Widget build(BuildContext context) {
    itemCourse = _itemCourse();
    return _gridView();
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 3,
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
          name: 'B407 ISaial',
          category:
              'The Lorem ipsum text is derived from sections rDe finibus bonorum et malorum',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 1,
          name: '1 Avengers: Infinity War 4',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 2,
          name: 'Avengers: Infinity War 4',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 3,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 4,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 5,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
      Course(
          id: 6,
          name: 'Avengers: Infinity War',
          category: 'MCSCW',
          content:
              'Michael Grisanti is Professor of Old Testament at The Master’s Seminary where his scholarly interests include Deuteronomy, Old Testament theology, biblical ethics, the prophets, and the history of Israel. He has been actively involved in ministries around the world, which have brought him to Albania, Chile, Colombia, Honduras, Israel, Italy, Japan, Jordan, New Zealand, Portugal, Romania, Russia, South Africa, Spain, Ukraine, and the United Kingdom.  He leads trips to Israel annually (sometimes 2 a year).',
          imageUrl: 'assets/images/image-course.png'),
    ];
  }
}
