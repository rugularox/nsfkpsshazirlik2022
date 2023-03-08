import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsfkpsshazirlik2022/yapim_asamasi.dart';

void snackgetir(BuildContext context, String mesaj) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mesaj),
  ));
}

void nettenyukleniyor(BuildContext context) {
  snackgetir(context, 'VERİLER İNTERNETTEN YÜKLENİYOR, LÜTFEN BEKLEYİNİZ...');
}

void notlaryukleniyor(BuildContext context) {
  snackgetir(context, 'Tüm veriler yükleniyor, bu işlem biraz zaman alabilir');
}

void yapimAsamasi(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => YapimAsamasi()));
}
