import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nsfkpsshazirlik2022/sabitler.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_deneme_ana.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_konular.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_notlar_ana.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_notlar_rastgele.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_rasgelesoru.dart';
import 'package:nsfkpsshazirlik2022/tarih_konu/tarih_sorular_ana.dart';
import 'package:nsfkpsshazirlik2022/turkce/turkce_konular.dart';
import 'package:nsfkpsshazirlik2022/turkce/turkce_notlar_ana.dart';
import 'package:nsfkpsshazirlik2022/vatandaslik/vatandaslik_konular.dart';
import 'package:nsfkpsshazirlik2022/vatandaslik/vatandaslik_notlar_ana.dart';
import 'package:nsfkpsshazirlik2022/vatandaslik/vatandaslik_sorular_ana.dart';

import 'cografya/cografya_deneme_ana.dart';
import 'cografya/cografya_konular.dart';
import 'cografya/cografya_notlar_ana.dart';
import 'cografya/cografya_sorular_ana.dart';
import 'fonksiyonlar.dart';
import 'guncel_bilgiler/guncel_bilgiler_ana.dart';
import 'guncel_bilgiler/guncel_sorular.dart';

void main() {
  runApp(MaterialApp(home: AnaSayfam()));
}

class AnaSayfam extends StatefulWidget {
  @override
  State<AnaSayfam> createState() => _AnaSayfamState();
}

class _AnaSayfamState extends State<AnaSayfam> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpssgenelanabanner,
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
    //   String secilitap = Provider.of<StateData>(context).secilentab;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Text('Kpss Hazırlık'),
          centerTitle: true,
        ),
        //   drawer: Ana_Menu(),
        body: Ana_Sayfa_Secim(),
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

class Ana_Sayfa_Secim extends StatelessWidget {
  const Ana_Sayfa_Secim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ListTile(
        //   leading: Icon(Icons.arrow_right),
        //   title: Text('Tüm Notları Listele'),
        //   onTap: () {
        //     notlaryukleniyor(context);
        //     snackgetir(context,
        //         'Notların detayını okumak için not üzerine tıklayınız');
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => TumNotlar()));
        //   },
        // ),
        ListTile(
          leading: Icon(Icons.menu_book_outlined),
          title: Text('TARİH'),
          tileColor: Colors.blueAccent,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Konu Anlatımı'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TarihKonu()));
          },
        ),

        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Soru Bankası'),
          onTap: () {
            snackgetir(context,
                'Rastgele 300 Soru Internetten yükleniyor lütfen bekleyiniz');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TarihRasgeleSoru()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Notları (Rastgele)'),
          onTap: () {
            snackgetir(context,
                'Rastgele 300 Ders Notu Internetten yükleniyor lütfen bekleyiniz');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TarihNotlarRastgele()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Notları (Konulara Göre)'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TarihNotlarAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Soruları (Konulara Göre)'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TarihSorularAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Tarih Denemeleri'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TarihDenemeAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('COĞRAFYA'),
          tileColor: Colors.green,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Coğrafya Konu Anlatımı'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CografyaKonu()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Coğrafya Notları'),
          onTap: () {
            snackgetir(context,
                'Notları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CografyaNotlarAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Coğrafya Soruları'),
          onTap: () {
            snackgetir(context,
                'Soruları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CografyaSorularAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Coğrafya Denemeleri'),
          onTap: () {
            snackgetir(context,
                'Soruları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CografyaDenemeAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.man),
          title: Text('VATANDAŞLIK'),
          tileColor: Colors.limeAccent,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Vatandaşlık Konu Anlatımı'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VatandaslikKonu()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Vatandaşlık Notları'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VatandaslikNotlarAna()));
          },
        ),

        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Vatandaşlık Soruları'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VatandaslikSorularAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.lock_clock),
          title: Text('GÜNCEL BİLGİLER'),
          tileColor: Colors.pinkAccent,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Kpss Güncel Bilgiler '),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetaySayfamGuncel()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Güncel Bilgiler Soruları'),
          onTap: () {
            snackgetir(context,
                'Soruları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GuncelSorular()));
          },
        ),
        ListTile(
          leading: Icon(Icons.flag),
          title: Text('TÜRKÇE'),
          tileColor: Colors.tealAccent,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Türkçe Konu Anlatımı'),
          onTap: () {
            snackgetir(context,
                'Konuları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TurkceKonu()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Türkçe Notları'),
          onTap: () {
            snackgetir(context,
                'Notları Okuyabilmeniz için İnternet Bağlatınız Açık Olmalı');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TurkceNotlarAna()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Türkçe Soruları'),
          onTap: () {
            yapimAsamasi(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text('MATEMATİK / GEOMETRİ'),
          tileColor: Colors.orange,
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Matematik Konu Anlatımı'),
          onTap: () {
            yapimAsamasi(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Matematik Notları'),
          onTap: () {
            yapimAsamasi(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text('Matematik Soruları'),
          onTap: () {
            yapimAsamasi(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.man),
          title: Text('GENEL KPSS DENEMELER'),
          tileColor: Colors.limeAccent,
        ),
      ],
    );
  }
}

class Ana_Menu extends StatelessWidget {
  const Ana_Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Text('Seçenekler'),
              decoration: BoxDecoration(color: Colors.lightBlue)),
          ExpansionTile(
            leading: Icon(Icons.menu_book_outlined),
            title: Text('Tarih'),
            children: [
              ListTile(
                title: Text('Tarih Konu Anlatımı'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TarihKonu()));
                },
              ),
              ListTile(
                title: Text('Tarih Notları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Soruları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Denemeleri'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.language),
            title: Text('Coğrafya'),
            children: [
              ListTile(
                title: Text('Tarih Konu Anlatımı'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Notları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Soruları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Denemeleri'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.man),
            title: Text('Vatandaşlık'),
            children: [
              ListTile(
                title: Text('Tarih Konu Anlatımı'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Notları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Soruları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.flag),
            title: Text('Türkçe'),
            children: [
              ListTile(
                title: Text('Tarih Konu Anlatımı'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Notları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Soruları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Tarih Denemeleri'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.list),
            title: Text('Güncel Bilgiler'),
            children: [
              ListTile(
                title: Text('Güncel Bilgiler'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              ),
              ListTile(
                title: Text('Güncel Bilgiler Soruları'),
                onTap: () {
                  //   Provider.of<StateData>(context, listen: false).yenitab('tum');
                  Navigator.pop(context);
                  ;
                },
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text('Genel Deneme Sınavları'),
            onTap: () {
              //   Provider.of<StateData>(context, listen: false).yenitab('tum');
              Navigator.pop(context);
              ;
            },
          ),
        ],
      ),
    );
  }
}
