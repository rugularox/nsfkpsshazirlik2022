import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../datalar.dart';

class TumNotlar extends StatefulWidget {
  @override
  State<TumNotlar> createState() => _TumNotlarState();
}

class _TumNotlarState extends State<TumNotlar> {
  Future<List<Tumbilgiler>> notgetir() async {
    var url = Uri.parse('https://www.guncelkpssbilgi.com/flutter/Hepsi.php');

    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Tumbilgiler> tumList = items.map<Tumbilgiler>((json) {
        return Tumbilgiler.fromJson(json);
      }).toList();
      return tumList;
    } else {
      throw Exception('Veriler Yüklenirken Hata Oluştu');
    }
  }

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.red[200], Colors.white];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[800], title: Text('Tüm Notlar')),
      body: Container(
        child: FutureBuilder<List<Tumbilgiler>>(
          future: notgetir(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  tileColor: colors[index % colors.length],
                  title: Text(snapshot.data![index].baslik),
                  onTap: () {
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

  void navigateToDetail(AsyncSnapshot<List<Tumbilgiler>> data, int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailTumNot(data, index)));
  }
}

class DetailTumNot extends StatefulWidget {
  int index;
  final AsyncSnapshot<List<Tumbilgiler>> data;

  DetailTumNot(this.data, this.index);

  @override
  State<DetailTumNot> createState() => _DetailTumNotState();
}

class _DetailTumNotState extends State<DetailTumNot> {
  // late BannerAd _bannerAd;
  // bool _isBannerAdReady = false;
  // InterstitialAd? _interstitialAd;
  int bilgindex = 1;
  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: guncelbilgilergecis,
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (InterstitialAd ad) {
  //         _interstitialAd = ad;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         _interstitialAd = null;
  //         _createInterstitialAd();
  //       },
  //     ),
  //   );
  // }
  //
  // void loadBanneAds() {
  //   _bannerAd = BannerAd(
  //       size: AdSize.banner,
  //       adUnitId: gunceldetaybanner,
  //       listener: BannerAdListener(onAdLoaded: (_) {
  //         setState(() {
  //           _isBannerAdReady = true;
  //         });
  //       }, onAdFailedToLoad: (ad, error) {
  //         print('Failed to load Banner Ad${error.message}');
  //         _isBannerAdReady = false;
  //         ad.dispose();
  //       }),
  //       request: AdRequest())
  //     ..load();
  // }

  // void initState() {
  //   loadBanneAds();
  //   _createInterstitialAd();
  //   super.initState();
  // }
  //
  // void dispose() {
  //   // TODO: Dispose a BannerAd object
  //   _bannerAd.dispose();
  //   _interstitialAd?.dispose();
  //   super.dispose();
  // }
  //
  // void _showInterstitialAd() {
  //   if (_interstitialAd != null) {
  //     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //         ad.dispose();
  //         _createInterstitialAd();
  //       },
  //       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //         ad.dispose();
  //         _createInterstitialAd();
  //       },
  //     );
  //     _interstitialAd!.show();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Detay')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    widget.data.data![widget.index].baslik,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                color: Colors.yellow[100],
                padding: EdgeInsets.all(4),
                child: SingleChildScrollView(
                    child: Text(
                  widget.data.data![widget.index].aciklama,
                  style: TextStyle(fontSize: 16),
                )),
              ),
            ),
            // if (_isBannerAdReady)
            //   Expanded(
            //     flex: 1,
            //     child: Container(
            //       height: _bannerAd.size.height.toDouble(),
            //       //  width: _bannerAd.size.width.toDouble(),
            //       width: double.infinity,
            //       child: AdWidget(
            //         ad: _bannerAd,
            //       ),
            //       //  child: Text(_isBannerAdReady.toString() +
            //       //      'BANNER REKLAM BURADA OLACAK'),
            //     ),
            //   ),
            Divider(
              height: 10,
              color: Colors.deepPurple,
              thickness: 3,
            ),
            //getDetailedData(data, widget.index),
            //     Text(widget.index.toString()),
            Expanded(
              flex: 1,
              child: Container(
                child: nabigationDetay(context),
              ),
            ),
          ],
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
              bilgindex--;
              widget.index > 0 ? widget.index-- : widget.index;
            });
          },
        ),
        IconButton(
          icon: Icon(
            Icons.navigate_next_outlined,
            size: 30,
          ),
          onPressed: () {
            if (bilgindex % 10 == 0) {
              //_showInterstitialAd();
            }
            setState(() {
              bilgindex++;
              widget.index < widget.data.data!.length + -1
                  ? widget.index++
                  : widget.index;
            });
          },
        ),
        IconButton(
          onPressed: () {
            final url = 'https://www.guncelkpssbilgi.com/';
            // await Share.share('${textdata.value.text} ${url}');

            // Share.share('"' +
            //     widget.data.data![widget.index].aciklama +
            //     '"' +
            //     '  ' +
            //     '${url}');
          },
          icon: Icon(Icons.share),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'LİSTE',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
