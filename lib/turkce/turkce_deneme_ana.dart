import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'turkce_deneme_detay.dart';

class VatandaslikDenemeAna extends StatefulWidget {
  @override
  State<VatandaslikDenemeAna> createState() => _VatandaslikDenemeAnaState();
}

class _VatandaslikDenemeAnaState extends State<VatandaslikDenemeAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vatandaşlık Deneme Sınavları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            VatandaslikDenemeListele(context, 1),
            VatandaslikDenemeListele(context, 2),
          ],
        ),
      ),
    );
  }

  ListTile VatandaslikDenemeListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(cografdeneme[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VatandaslikDenemeWebDetay(id)));
      },
    );
  }
}
