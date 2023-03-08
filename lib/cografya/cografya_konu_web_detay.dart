import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../sabitler.dart';

class CografyaKonuDetay extends StatelessWidget {
  int konu_id = 1;

  CografyaKonuDetay(this.konu_id);
//  const SlamiyetOncesi({Key? key}) : super(key: key);
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(cografyakonular[konu_id]),
        ),
        body: Container(
            child: WebView(
                onProgress: (int progress) {
                  //  Text('WebView is loading');
                  //nettenyukleniyor(context);
                  //   print('WebView is loading (progress : $progress%)');
                },
                gestureNavigationEnabled: true,
                initialUrl: cogadresler[konu_id],
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                })),
      ),
    );
  }
}
