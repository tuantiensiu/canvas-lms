import 'package:canvas_lms/screen/CourseList.dart';
import 'package:canvas_lms/model/Course.dart';
import 'package:canvas_lms/screen/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = 'Flutter drawer demo';
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: appTitle,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: SidebarMenu(),
    // );
    //
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: appTitle,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SidebarMenu(),
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Canvas LMS'),
        ),
        sideBar: SideBar(
          items: const [
            MenuItem(
              title: 'Account',
              icon: Icons.account_circle,
              children: [
                MenuItem(
                    title: 'Notifications',
                    route: '/secondLevelItem1',
                    icon: Icons.notifications),
                MenuItem(
                    title: 'Profile',
                    route: '/secondLevelItem2',
                    icon: Icons.person_outline_outlined),
              ],
            ),
            MenuItem(
              title: 'Dashboard',
              route: '/',
              icon: Icons.dashboard,
            ),
            MenuItem(
              title: 'Courses',
              route: '/',
              icon: Icons.menu_book,
            ),
            MenuItem(
              title: 'Calendar',
              route: '/',
              icon: Icons.calendar_today,
            ),
            MenuItem(
              title: 'Inbox',
              route: '/',
              icon: Icons.email,
            ),
            MenuItem(
              title: 'History',
              route: '/',
              icon: Icons.history,
            ),
            MenuItem(
              title: 'Help',
              route: '/',
              icon: Icons.help,
            ),
          ],
          selectedRoute: '/',
          onSelected: (item) {
            Navigator.of(context).pushNamed(item.route);
          },
          // header: Container(
          //   height: 50,
          //   width: double.infinity,
          //   color: Colors.black26,
          //   child: Center(
          //     child: Text(
          //       'header2',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: Colors.black26,
            child: Center(
              child: Text(
                'Copyright',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(children: [
            Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dashboard', style: TextStyle(fontSize: 20)),
                        Divider(),
                        Container(
                          child: DashboardScreen(),
                        ),
                      ]),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'To Do',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      Text('Nothing for now'),
                      Container(
                        child: Text(
                          'Recent Feedback',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      Text('Nothing for now')
                    ],
                  ),
                )),
          ]),
        ));
  }
}
