import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'vatandaslik_notlar_web_detay.dart';

class VatandaslikNotlarAna extends StatefulWidget {
  @override
  State<VatandaslikNotlarAna> createState() => _VatandaslikNotlarAnaState();
}

class _VatandaslikNotlarAnaState extends State<VatandaslikNotlarAna> {
  // const TarihKonu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vatandaşlık Notları'),
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
            VatandaslikNotListele(context, 5),
            VatandaslikNotListele(context, 6),
            VatandaslikNotListele(context, 7),
          ],
        ),
      ),
    );
  }

  ListTile VatandaslikNotListele(BuildContext context, int id) {
    return ListTile(
      title: (Text(vatannot[id])),
      onTap: () {
        nettenyukleniyor(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VatandaslikNotlarWebDetay(id)));
      },
    );
  }
}
