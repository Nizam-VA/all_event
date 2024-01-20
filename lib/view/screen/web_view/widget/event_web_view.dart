import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventWebView extends StatefulWidget {
  const EventWebView({super.key, required this.controller});
  final WebViewController controller;
  @override
  State<EventWebView> createState() => _EventWebViewState();
}

class _EventWebViewState extends State<EventWebView> {
  var loadingPercentage = 0;

  @override
  void initState() {
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(value: loadingPercentage / 100)
      ],
    );
  }
}
