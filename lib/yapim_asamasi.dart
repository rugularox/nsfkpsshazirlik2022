import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YapimAsamasi extends StatelessWidget {
  // const YapimAsamasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('YAPIM AŞAMASI'),
        ),
        body: Center(
            child: Container(child: Text('BU BÖLÜM YAPIM AŞAMASINDADIR'))),
      ),
    );
  }
}
