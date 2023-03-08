import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'cografya_deneme_detay.dart';

class CografyaDenemeAna extends StatefulWidget {
  @override
  State<CografyaDenemeAna> createState() => _CografyaDenemeAnaState();
}

class _CografyaDenemeAnaState extends State<CografyaDenemeAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coğrafya Deneme Sınavları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            CografyaDenemeListele(context, 1),
            CografyaDenemeListele(context, 2),
          ],
        ),
      ),
    );
  }

  ListTile CografyaDenemeListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(cografdeneme[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CografyaDenemeWebDetay(id)));
      },
    );
  }
}
