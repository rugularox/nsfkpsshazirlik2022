import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import '../datalar.dart';
import '../sabitler.dart';

class TarihRasgeleSoru extends StatefulWidget {
  // const RasgeleSoru({Key? key}) : super(key: key);

  @override
  State<TarihRasgeleSoru> createState() => _TarihRasgeleSoruState();
}

class _TarihRasgeleSoruState extends State<TarihRasgeleSoru> {
  Future<List<TarihSorulardata>> fetchsorular() async {
    var url = Uri.parse(
        'https://www.guncelkpssbilgi.com/flutter/tarih/TarihSoruListele.php');

    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<TarihSorulardata> tarihList = items.map<TarihSorulardata>((json) {
        return TarihSorulardata.fromJson(json);
      }).toList();
      //    print(guncelList);
      return tarihList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.blue[100], Colors.white];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Rastgele Soru'),
      ),
      body: Container(
        child: FutureBuilder<List<TarihSorulardata>>(
          future: fetchsorular(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  tileColor: colors[index % colors.length],
                  title: Text((index + 1).toString() +
                      '- ' +
                      snapshot.data![index].soru),
                  onTap: () {
                    // if ((index + 1) % 10 == 0) {
                    //   _showInterstitialAd();
                    // }
                    navigateToDetail(snapshot, index);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void navigateToDetail(AsyncSnapshot<List<TarihSorulardata>> data, int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailSoru(data, index)));
  }
}

class DetailSoru extends StatefulWidget {
  int index;
  final AsyncSnapshot<List<TarihSorulardata>> data;
  DetailSoru(this.data, this.index);
  @override
  State<DetailSoru> createState() => _DetailSoruState();
}

class _DetailSoruState extends State<DetailSoru> {
  // degerlerisifirla();
  int soruindex = 1;
  bool cevapverildi = false;

  Color anarenk = Colors.indigoAccent;
  Color dogrurenk = Colors.green;
  Color yanlisrenk = Colors.red;

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  dogrucevabiboya(String dogrusik) {
    btnrenk[dogrusik] = Colors.green;
  }

  void loadBanneAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: kpssgeneltarihrastgelesorubanner,
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

  InterstitialAd? _interstitialAd;
  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: kpssgeneltarihrastgelesorugecis,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _createInterstitialAd();
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  void initState() {
    loadBanneAds();
    _createInterstitialAd();
    super.initState();
  }

  void dispose() {
    degerlerisifirla();
    _interstitialAd?.dispose();
    _bannerAd.dispose();
  }

  Widget cevapbutton(String k) {
    /// fonksiyonlar

    Map<String, String> sikkontrol = {
      "a": widget.data.data![widget.index].a,
      "b": widget.data.data![widget.index].b,
      "c": widget.data.data![widget.index].c,
      "d": widget.data.data![widget.index].d,
      "e": widget.data.data![widget.index].e,
    };

    return MaterialButton(
      onPressed: () => cevapkontrol(k),
      child: Text(
        sikkontrol[k].toString(),
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Alike",
          fontSize: 16.0,
        ),
        maxLines: 1,
      ),
      color: btnrenk[k],
      splashColor: Colors.indigo[700],
      highlightColor: Colors.indigo[700],
      minWidth: Size.fromHeight(20).width,
      //    minimumSize: Size.fromHeight(20),
      // height: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
  // String a = datam.data![1].a;
  //

  cevapkontrol(String k) {
    if (widget.data.data![widget.index].dogrusik == k) {
      anarenk = dogrurenk;
    } else {
      anarenk = yanlisrenk;
    }
    setState(() {
      dogrucevabiboya(widget.data.data![widget.index].dogrusik);
      btnrenk[k] = anarenk;
      cevapverildi = true;
    });
  }

  degerlerisifirla() {
    btnrenk['a'] = Colors.indigoAccent;
    btnrenk['b'] = Colors.indigoAccent;
    btnrenk['c'] = Colors.indigoAccent;
    btnrenk['d'] = Colors.indigoAccent;
    btnrenk['e'] = Colors.indigoAccent;
    cevapverildi = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SORU DETAY'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  (widget.index + 1).toString() +
                      ': ' +
                      widget.data.data![widget.index].soru,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: cevapbutton('a'),
                    ),
                    Divider(
                      height: 3,
                    ),
                    Expanded(child: cevapbutton('b')),
                    Divider(
                      height: 3,
                    ),
                    Expanded(child: cevapbutton('c')),
                    Divider(
                      height: 3,
                    ),
                    Expanded(child: cevapbutton('d')),
                    Divider(
                      height: 3,
                    ),
                    Expanded(child: cevapbutton('e')),
                    Divider(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    child: Text(
                        cevapverildi
                            ? 'AÇIKLAMA :' +
                                widget.data.data![widget.index].dogrucevap
                            : '',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: nabigationDetay(context),
              ),
            )
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

  Row nabigationDetay(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(
            Icons.navigate_before,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              degerlerisifirla();
              soruindex--;
              widget.index > 0 ? widget.index-- : widget.index;
              //   verilencevap = '';
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.navigate_next_outlined,
            size: 30,
          ),
          onPressed: () {
            if (soruindex % 10 == 0) {
              _showInterstitialAd();
            }

            setState(() {
              degerlerisifirla();
              soruindex++;
              widget.index < widget.data.data!.length + -1
                  ? widget.index++
                  : widget.index;
              //  verilencevap = '';
            });
          },
        ),
        TextButton(
            onPressed: () {
              setState(() {
                degerlerisifirla();
              });

              Navigator.pop(context);
            },
            child: Text(
              'LİSTE',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
