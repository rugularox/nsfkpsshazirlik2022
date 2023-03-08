import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_sorular_web_detay.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';

class TarihSorularAna extends StatefulWidget {
  @override
  State<TarihSorularAna> createState() => _TarihSorularAnaState();
}

class _TarihSorularAnaState extends State<TarihSorularAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tarih Soruları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('KONU SEÇİNİZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            TarihSoruListele(context, 1),
            TarihSoruListele(context, 2),
            TarihSoruListele(context, 3),
            TarihSoruListele(context, 4),
            TarihSoruListele(context, 5),
            TarihSoruListele(context, 6),
            TarihSoruListele(context, 7),
            TarihSoruListele(context, 8),
            TarihSoruListele(context, 9),
            TarihSoruListele(context, 10),
            TarihSoruListele(context, 11),
            TarihSoruListele(context, 12),
            TarihSoruListele(context, 13),
            TarihSoruListele(context, 14),
            TarihSoruListele(context, 15),
            TarihSoruListele(context, 16),
            TarihSoruListele(context, 17),
            TarihSoruListele(context, 18),
            TarihSoruListele(context, 19),
            TarihSoruListele(context, 20),
            TarihSoruListele(context, 21),
            TarihSoruListele(context, 22),
            TarihSoruListele(context, 23),
            TarihSoruListele(context, 24),
            TarihSoruListele(context, 25),
            TarihSoruListele(context, 26),
            TarihSoruListele(context, 27),
            TarihSoruListele(context, 28),
            TarihSoruListele(context, 29),
          ],
        ),
      ),
    );
  }

  ListTile TarihSoruListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(tarihsorular[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TarihSorularWebDetay(id)));
      },
    );
  }
}
