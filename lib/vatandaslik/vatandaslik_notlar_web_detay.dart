import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../sabitler.dart';

class VatandaslikNotlarWebDetay extends StatelessWidget {
  int konu_id = 1;

  VatandaslikNotlarWebDetay(this.konu_id);
//  const SlamiyetOncesi({Key? key}) : super(key: key);
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(vatannot[konu_id]),
        ),
        body: Container(
            child: WebView(
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                },
                gestureNavigationEnabled: true,
                initialUrl: vatannotadres[konu_id],
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                })),
      ),
    );
  }
}
