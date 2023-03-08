import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'cografya_notlar_web_detay.dart';

class CografyaNotlarAna extends StatefulWidget {
  @override
  State<CografyaNotlarAna> createState() => _CografyaNotlarAnaState();
}

class _CografyaNotlarAnaState extends State<CografyaNotlarAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coğrafya Notları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            // ListTile(
            //   title: (Text('Tüm Tarih Notları')),
            //   onTap: () {
            //     notlaryukleniyor(context);
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => TarihNotlar()));
            //   },
            // ),

            CografyaNotListele(context, 1),
            CografyaNotListele(context, 2),
            CografyaNotListele(context, 3),
            CografyaNotListele(context, 4),
            CografyaNotListele(context, 5),
          ],
        ),
      ),
    );
  }

  ListTile CografyaNotListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(cografnotlar[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CografyaNotlarWebDetay(id)));
      },
    );
  }
}
