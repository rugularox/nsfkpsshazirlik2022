import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'tatih_deneme_web_detay.dart';

class TarihDenemeAna extends StatefulWidget {
  @override
  State<TarihDenemeAna> createState() => _TarihDenemeAnaState();
}

class _TarihDenemeAnaState extends State<TarihDenemeAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tarih Deneme Sınavları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            TarihDenemeListele(context, 1),
            TarihDenemeListele(context, 2),
            TarihDenemeListele(context, 3),
            TarihDenemeListele(context, 4),
            TarihDenemeListele(context, 5),
            TarihDenemeListele(context, 6),
            TarihDenemeListele(context, 7),
            TarihDenemeListele(context, 8),
            TarihDenemeListele(context, 9),
            TarihDenemeListele(context, 10),
            TarihDenemeListele(context, 11),
            TarihDenemeListele(context, 12),
            TarihDenemeListele(context, 13),
            TarihDenemeListele(context, 14),
            TarihDenemeListele(context, 15),
            TarihDenemeListele(context, 16),
            TarihDenemeListele(context, 17),
          ],
        ),
      ),
    );
  }

  ListTile TarihDenemeListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(taridenemeler[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TarihDenemeWebDetay(id)));
      },
    );
  }
}
