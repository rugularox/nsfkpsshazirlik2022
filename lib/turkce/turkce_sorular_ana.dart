import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'turkce_sorular_web_detay.dart';

class VatandaslikSorularAna extends StatefulWidget {
  @override
  State<VatandaslikSorularAna> createState() => _VatandaslikSorularAnaState();
}

class _VatandaslikSorularAnaState extends State<VatandaslikSorularAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vatandaşlık Soruları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('SEÇİM YAPINIZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            VatandaslikSoruListele(context, 1),
            VatandaslikSoruListele(context, 2),
            VatandaslikSoruListele(context, 3),
            VatandaslikSoruListele(context, 4),
            VatandaslikSoruListele(context, 5),
          ],
        ),
      ),
    );
  }

  ListTile VatandaslikSoruListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(vatansoru[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VatandaslikSorularWebDetay(id)));
      },
    );
  }
}
