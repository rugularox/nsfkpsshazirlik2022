import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'cografya_sorular_web_detay.dart';

class CografyaSorularAna extends StatefulWidget {
  @override
  State<CografyaSorularAna> createState() => _CografyaSorularAnaState();
}

class _CografyaSorularAnaState extends State<CografyaSorularAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coğrafya Soruları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            CografyaSoruListele(context, 1),
            CografyaSoruListele(context, 2),
            CografyaSoruListele(context, 3),
            CografyaSoruListele(context, 4),
            CografyaSoruListele(context, 5),
            CografyaSoruListele(context, 6),
            CografyaSoruListele(context, 7),
            CografyaSoruListele(context, 8),
            CografyaSoruListele(context, 9),
            CografyaSoruListele(context, 10),
            CografyaSoruListele(context, 11),
            CografyaSoruListele(context, 12),
            CografyaSoruListele(context, 13),
            CografyaSoruListele(context, 14),
            CografyaSoruListele(context, 15),
            CografyaSoruListele(context, 16),
            CografyaSoruListele(context, 17),
            CografyaSoruListele(context, 18),
          ],
        ),
      ),
    );
  }

  ListTile CografyaSoruListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(cografsorular[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CografyaSorularWebDetay(id)));
      },
    );
  }
}
