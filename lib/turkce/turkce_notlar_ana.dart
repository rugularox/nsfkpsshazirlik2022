import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'turkce_notlar_web_detay.dart';

class TurkceNotlarAna extends StatefulWidget {
  @override
  State<TurkceNotlarAna> createState() => _TurkceNotlarAnaState();
}

class _TurkceNotlarAnaState extends State<TurkceNotlarAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Türkçe Notları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            VatandaslikNotListele(context, 1),
            VatandaslikNotListele(context, 2),
            VatandaslikNotListele(context, 3),
            VatandaslikNotListele(context, 4),
          ],
        ),
      ),
    );
  }

  ListTile VatandaslikNotListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(turkcenotlar[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TurkceNotlarWebDetay(id)));
      },
    );
  }
}
