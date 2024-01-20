import 'package:all_events/view/screen/web_view/widget/event_web_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenWebView extends StatefulWidget {
  ScreenWebView({super.key, required this.websiteURL});
  final String websiteURL;

  @override
  State<ScreenWebView> createState() => _ScreenWebViewState();
}

class _ScreenWebViewState extends State<ScreenWebView> {
  double progressValue = 0;

  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()..loadRequest(Uri.parse(widget.websiteURL));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EventWebView(controller: controller),
      ),
    );
  }
}
