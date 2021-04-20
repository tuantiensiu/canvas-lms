import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final appTitle = 'Flutter drawer demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Canvas LMS',
                style: textTheme.headline6,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Courses'),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Inbox'),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              selected: _selectedDestination == 4,
              onTap: () => selectDestination(4),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Commons'),
              selected: _selectedDestination == 5,
              onTap: () => selectDestination(5),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help'),
              selected: _selectedDestination == 6,
              onTap: () => selectDestination(6),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
