import 'package:canvas_lms/screen/DashboardPage.dart';
import 'package:canvas_lms/screen/second_level_item_1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appTitle = 'Flutter drawer demo';

  static const MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Colors.white;

  @override
  Widget build(BuildContext context) {
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
              title: 'VGM LMS',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: themeBlack,
                    ),
                primaryTextTheme: Theme.of(context).textTheme.apply(
                      bodyColor: themeTextPrimary,
                    ),
                primaryIconTheme: IconThemeData(
                  color: themeTextPrimary,
                ),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              onGenerateRoute: (settings) {
                final page = _getPageWidget(settings);
                if (page != null) {
                  return PageRouteBuilder(
                      settings: settings,
                      pageBuilder: (_, __, ___) => page,
                      transitionsBuilder: (_, anim, __, child) {
                        return FadeTransition(
                          opacity: anim,
                          child: child,
                        );
                      });
                }
                return null;
              },
            );
          },
        );
      },
    );
  }

  Widget _getPageWidget(RouteSettings settings) {
    final uri = Uri.parse(settings.name);
    print(uri);
    switch (uri.path) {
      case '/':
        return DashboardPage();
      case '/secondLevelItem1':
        return SecondLevelItem1Page();
    }
    return null;
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key key,
    @required this.route,
    @required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  final List<MenuItem> _sideBarItems = const [
    MenuItem(
      title: 'Trang Chủ',
      route: '/',
      icon: Icons.dashboard,
    ),
    MenuItem(title: 'Khóa Học', route: '/course', icon: Icons.dashboard),
    // MenuItem(
    //   title: 'Top Level',
    //   icon: Icons.file_copy,
    //   children: [
    //     MenuItem(
    //       title: 'Second Level Item 1',
    //       route: '/secondLevelItem1',
    //     ),
    //     MenuItem(
    //       title: 'Second Level Item 2',
    //       route: '/secondLevelItem2',
    //     ),
    //     MenuItem(
    //       title: 'Third Level',
    //       children: [
    //         MenuItem(
    //           title: 'Third Level Item 1',
    //           route: '/thirdLevelItem1',
    //         ),
    //         MenuItem(
    //           title: 'Third Level Item 2',
    //           route: '/thirdLevelItem2',
    //           icon: Icons.image,
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ];

  final List<MenuItem> _adminMenuItems = const [
    MenuItem(
      title: 'User Profile',
      icon: Icons.account_circle,
      route: '/',
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/secondLevelItem1',
    ),
    MenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: '/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('VGM LMS'),
        actions: [
          PopupMenuButton(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((MenuItem item) {
                return PopupMenuItem<MenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              print(
                  'actions: onSelected(): title = ${item.title}, route = ${item.route}');
              Navigator.of(context).pushNamed(item.route);
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.black26,
        borderColor: Color(0xFFE7E7E7),
        iconColor: Colors.black87,
        activeIconColor: Colors.blue,
        textStyle: TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 13,
        ),
        activeTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route);
          }
        },
        // header: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: Colors.black26,
        //   child: Center(
        //     child: Text(
        //       'header',
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
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
