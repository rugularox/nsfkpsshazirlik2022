import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'turkce_konu_web_detay.dart';

class TurkceKonu extends StatefulWidget {
  @override
  State<TurkceKonu> createState() => _TurkceKonuState();
}

class _TurkceKonuState extends State<TurkceKonu> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpssturkcekonuanabanner,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print('Failed to load Banner Ad${error.message}');
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: AdRequest())
      ..load();
  }

  @override
  void initState() {
    loadBanneAds();

    super.initState();
  }

  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Text('Türkçe Konuları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('BİR KONU SEÇİNİZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            ListTile(
              title: (Text('1-  Ses Bilgisi ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(1)));
              },
            ),
            ListTile(
              title: (Text('2-  Sözcükte ve Sözde Anlam')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(2)));
              },
            ),
            ListTile(
              title: (Text('3- Cümlede Anlam')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(3)));
              },
            ),
            ListTile(
              title: (Text('4- Paragraf')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(4)));
              },
            ),
            ListTile(
              title: (Text('5- Yazım Kuralları')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(5)));
              },
            ),
            ListTile(
              title: (Text('6- Noktalama İşaretleri')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(6)));
              },
            ),
            ListTile(
              title: (Text('7- Dil Bilgisi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(7)));
              },
            ),
            ListTile(
              title: (Text('Türkçe Konu Analtım Kitabı')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TurkceKonuDetay(8)));
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: _bannerAd.size.height.toDouble(),
          //  width: _bannerAd.size.width.toDouble(),
          width: double.infinity,
          child: _isBannerAdReady
              ? AdWidget(
                  ad: _bannerAd,
                )
              : Text('Reklam Yükleniyor...'),
          //  child: Text(_isBannerAdReady.toString() +
          //      'BANNER REKLAM BURADA OLACAK'),
        ),
      ),
    );
  }
}
