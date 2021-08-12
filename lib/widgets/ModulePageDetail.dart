import 'package:canvas_lms/api.dart';
import 'package:canvas_lms/modal/DetailPage.dart';
import 'package:canvas_lms/modal/ModuleItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_windows/webview_windows.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
              "${snapshot.data.body}",
              customStylesBuilder: (e) =>
                  e.classes.contains('link_iframe') ? {'color': 'red'} : null,
              factoryBuilder: () => _WidgetFactory(),
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

class _WidgetFactory extends WidgetFactory {
  @override
  void parse(BuildMetadata meta) {
    super.parse(meta);

    if (meta.element.classes.contains('link_iframe')) {
      meta.register(BuildOp(
        onWidgets: (meta, widgets) => listOrNull(
          buildColumnPlaceholder(meta, widgets)?.wrapWith(
            (_, child) => _QuoteWidget(child),
          ),
        ),
      ));
    }
  }
}

class _QuoteWidget extends StatelessWidget {
  final Widget child;

  _QuoteWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
          widthFactor: 0.5,
          child: GestureDetector(
              child: Text("Click here",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => FullScreenDialog(),
                    fullscreenDialog: true,
                  ),
                );
              })),
    );
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
        child: WebviewComponent(),
      ),
    );
  }
}

class WebviewComponent extends StatefulWidget {
  WebviewComponent({Key key}) : super(key: key);

  @override
  _WebviewComponentState createState() => _WebviewComponentState();
}

class _WebviewComponentState extends State<WebviewComponent> {
  final _controller = WebviewController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Optionally initialize the webview environment using
    // a custom user data directory and/or custom chromium command line flags
    //await WebviewController.initializeEnvironment(
    //    additionalArguments: '--show-fps-counter');

    await _controller.initialize();
    _controller.url.listen((url) {
      _textController.text = url;
    });

    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.loadUrl('https://flutter.dev');

    if (!mounted) return;

    setState(() {});
  }

  Widget compositeView() {
    if (!_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'URL',
                    contentPadding: EdgeInsets.all(10.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        _controller.reload();
                      },
                    )),
                textAlignVertical: TextAlignVertical.center,
                controller: _textController,
                onSubmitted: (val) {
                  _controller.loadUrl(val);
                },
              ),
            ),
            Expanded(
                child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Webview(
                          _controller,
                          permissionRequested: _onPermissionRequested,
                        ),
                        StreamBuilder<LoadingState>(
                            stream: _controller.loadingState,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data == LoadingState.loading) {
                                return LinearProgressIndicator();
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ))),
          ],
        ),
      );
    }
  }

  Future<WebviewPermissionDecision> _onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await showDialog<WebviewPermissionDecision>(
      context: navigatorKey.currentContext,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('WebView permission requested'),
        content: Text('WebView has requested permission \'$kind\''),
        actions: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.deny),
            child: const Text('Deny'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, WebviewPermissionDecision.allow),
            child: const Text('Allow'),
          ),
        ],
      ),
    );

    return decision ?? WebviewPermissionDecision.none;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: compositeView(),
    );
  }
}
