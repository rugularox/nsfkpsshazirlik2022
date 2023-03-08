import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';
import 'vatandaslik_konu_web_detay.dart';

class VatandaslikKonu extends StatefulWidget {
  @override
  State<VatandaslikKonu> createState() => _VatandaslikKonuState();
}

class _VatandaslikKonuState extends State<VatandaslikKonu> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpssvatankonuanabanner,
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
          title: Text('Vatandaşlık Konuları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('BİR KONU SEÇİNİZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            ListTile(
              title: (Text('1- Kpss Temel Hukuk Bilgisi ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VatandaslikKonuDetay(1)));
              },
            ),
            ListTile(
              title: (Text('2- Türk Anayasa Tarihi ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VatandaslikKonuDetay(2)));
              },
            ),
            ListTile(
              title: (Text('3- Temel Hak ve Hürriyetler ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VatandaslikKonuDetay(3)));
              },
            ),
            ListTile(
              title: (Text('4- Vatandaşlık Kitabı')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VatandaslikKonuDetay(4)));
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
