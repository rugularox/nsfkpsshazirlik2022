import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_notlar_web_detay.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';

class TarihNotlarAna extends StatefulWidget {
  @override
  State<TarihNotlarAna> createState() => _TarihNotlarAnaState();
}

class _TarihNotlarAnaState extends State<TarihNotlarAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tarih Notları'),
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

            TarihNotListele(context, 1),
            TarihNotListele(context, 2),
            TarihNotListele(context, 3),
            TarihNotListele(context, 4),
            TarihNotListele(context, 5),
            TarihNotListele(context, 6),
            TarihNotListele(context, 7),
            TarihNotListele(context, 8),
            TarihNotListele(context, 9),
            TarihNotListele(context, 10),
            TarihNotListele(context, 11),
            TarihNotListele(context, 12),
            TarihNotListele(context, 13),
            TarihNotListele(context, 14),
            TarihNotListele(context, 15),
            TarihNotListele(context, 16),
            TarihNotListele(context, 17),
            TarihNotListele(context, 18),
            TarihNotListele(context, 19),
            TarihNotListele(context, 20),
            TarihNotListele(context, 21),
            TarihNotListele(context, 22),
            TarihNotListele(context, 23),
            TarihNotListele(context, 24),
            TarihNotListele(context, 25),
            TarihNotListele(context, 26),
            TarihNotListele(context, 27),
            TarihNotListele(context, 28),
            TarihNotListele(context, 29),
            //      TarihNotListele(context, 30),
          ],
        ),
      ),
    );
  }

  ListTile TarihNotListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(tarihnotlar[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TarihNotlarWebDetay(id)));
      },
    );
  }
}
