import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_konu_detay.dart';

import '../fonksiyonlar.dart';
import '../sabitler.dart';

class TarihKonu extends StatefulWidget {
  @override
  State<TarihKonu> createState() => _TarihKonuState();
}

class _TarihKonuState extends State<TarihKonu> {
  // const TarihKonu({Key? key}) : super(key: key);
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpsstarihkonuanabanner,
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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Text('Tarih Konuları'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: (Text('BİR KONU SEÇİNİZ')),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            ListTile(
              title: (Text('1- İslamiyet Öncesi Türk Tarihi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(1)));
              },
            ),
            ListTile(
              title: (Text('2- İlk Müslüman Türk Devletleri ve Beylikler')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(2)));
              },
            ),
            ListTile(
              title: (Text('3- Türkiye Tarihi Konu Anlatımı')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(3)));
              },
            ),
            ListTile(
              title: (Text('4- Osmanlı Kuruluş Kültür ve Medeniyet')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(4)));
              },
            ),
            ListTile(
              title: (Text('5- Osmanlı Devleti Duraklama Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(5)));
              },
            ),
            ListTile(
              title: (Text('6- Osmanlı Devleti Gerileme Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(6)));
              },
            ),
            ListTile(
              title: (Text('7- Avrupa Tarihi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(7)));
              },
            ),
            ListTile(
              title: (Text('8- Osmanlı Devleti Çöküş ve Dağılma Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(8)));
              },
            ),
            ListTile(
              title: (Text('9- 20. Yüzyılda Osmanlı Devleti')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TarihKonuDetay(9)));
              },
            ),
            ListTile(
              title: (Text('10- I. Dünya Savaşı ve Cemiyetler')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(10)));
              },
            ),
            ListTile(
              title: (Text('11- Kurtuluş Savaşı Hazırlık Kongreler Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(11)));
              },
            ),
            ListTile(
              title: (Text('12- I. TBMM Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(12)));
              },
            ),
            ListTile(
              title: (Text('13- Kurtuluş Savaşı Muharebeler Dönemi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(13)));
              },
            ),
            ListTile(
              title: (Text('14- Cumhuriyet Dönemi Partiler ve İnkilaplar')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(14)));
              },
            ),
            ListTile(
              title: (Text('15- Atatürk İlkeleri ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(15)));
              },
            ),
            ListTile(
              title: (Text('16- Cumhuriyet Dönemi Dış Politika ')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(16)));
              },
            ),
            ListTile(
              title: (Text('17- II. Dünya Savaşı ve Sonraki Dönem')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(17)));
              },
            ),
            ListTile(
              title: (Text('18-  Çağdaş Türk ve Dünya Tarihi')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(18)));
              },
            ),
            ListTile(
              title: (Text('19- İç Politika')),
              onTap: () {
                nettenyukleniyor(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TarihKonuDetay(19)));
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
