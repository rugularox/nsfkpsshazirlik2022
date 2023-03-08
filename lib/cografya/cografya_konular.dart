import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'cografya_konu_web_detay.dart';

class CografyaKonu extends StatefulWidget {
  @override
  State<CografyaKonu> createState() => _CografyaKonuState();
}

class _CografyaKonuState extends State<CografyaKonu> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpsscografyakonuanabanner,
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
          title: Text('Coğrafya Konuları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('BİR KONU SEÇİNİZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            ListTile(
              title: (Text('1- Türkiyenin Coğrafi Konumu')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(1)));
              },
            ),
            ListTile(
              title: (Text('2- Türkiyenin Fiziki Coğrafyası ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(2)));
              },
            ),
            ListTile(
              title: (Text('3- Türkiyenin Ekonomik Coğrafyası  ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(3)));
              },
            ),
            ListTile(
              title: (Text('4- Türkiyenin Coğrafi Bölgeleri')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(4)));
              },
            ),
            ListTile(
              title: (Text('5- Türkiye Coğrafyası (Tüm Konular)')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(5)));
              },
            ),
            ListTile(
              title: (Text('6- Kpss Coğrafya Kitabı')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(6)));
              },
            ),
            ListTile(
              title: (Text('7- Kpss Coğrafya 140 Sayfa Konu Anlatımı')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CografyaKonuDetay(7)));
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
