import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

import '../datalar.dart';
import '../sabitler.dart';

class GuncelSorular extends StatefulWidget {
//  const GuncelSorular({Key? key}) : super(key: key);

  @override
  State<GuncelSorular> createState() => _GuncelSorularState();
}

class _GuncelSorularState extends State<GuncelSorular> {
  Future<List<Sorulardata>> fetchSorular() async {
    var url =
        Uri.parse('https://www.guncelkpssbilgi.com/flutter/GuncelSoru.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Sorulardata> soruList = items.map<Sorulardata>((json) {
        return Sorulardata.fromJson(json);
      }).toList();

      return soruList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.blue[100], Colors.white];

    return Scaffold(
      appBar: AppBar(
        title: Text('Güncel Bilgiler Soruları'),
      ),
      body: Container(
        child: FutureBuilder<List<Sorulardata>>(
          future: fetchSorular(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  tileColor: colors[index % colors.length],
                  title: Text(snapshot.data![index].soru),
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

  void navigateToDetail(AsyncSnapshot<List<Sorulardata>> data, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailSoru(
                  data,
                  index,
                )));
  }
}

class DetailSoru extends StatefulWidget {
  int index;
  final AsyncSnapshot<List<Sorulardata>> data;
  DetailSoru(this.data, this.index);
  @override
  State<DetailSoru> createState() => _DetailSoruState();
}

class _DetailSoruState extends State<DetailSoru> {
  bool cevapverildi = false;
  String verilencevap = '';
  int soruindex = 1;

  InterstitialAd? _interstitialAd;

  void initState() {
    _createInterstitialAd();
    super.initState();
  }

  void dispose() {
    degerlerisifirla();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: kpssgenelguncelsorugecis,
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

  @override
  Widget build(BuildContext context) {
    Color anarenk = Colors.indigoAccent;
    Color dogrurenk = Colors.green;
    Color yanlisrenk = Colors.red;

    Map<String, String> sikkontrol = {
      "a": widget.data.data![widget.index].a,
      "b": widget.data.data![widget.index].b,
      "c": widget.data.data![widget.index].c,
      "d": widget.data.data![widget.index].d,
      "e": widget.data.data![widget.index].e,
    };

    dogrucevabiboya(String dogrusik) {
      btnrenk[dogrusik] = Colors.green;
    }

    cevapkontrol(String k) {
      if (widget.data.data![widget.index].dogrusik == k) {
        anarenk = dogrurenk;
      } else {
        anarenk = yanlisrenk;
      }
      setState(() {
        dogrucevabiboya(widget.data.data![widget.index].dogrusik);
        btnrenk[k] = anarenk;
      });
    }

    Widget cevapbutton(String k) {
      degerlerisifirla() {
        setState(() {
          btnrenk['a'] = Colors.indigoAccent;
          btnrenk['b'] = Colors.indigoAccent;
          btnrenk['c'] = Colors.indigoAccent;
          btnrenk['d'] = Colors.indigoAccent;
          btnrenk['e'] = Colors.indigoAccent;
        });
      }

      return MaterialButton(
        onPressed: () => cevapkontrol(k),
        child: Text(
          sikkontrol[k].toString(),
          //   widget.data.data![widget.index].a,
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      );
    }

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
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  widget.data.data![widget.index].soru,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              flex: 2,
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
                    Expanded(
                      child: Container(
                        child: Text(
                            cevapverildi
                                ? 'DOĞRU CEVAP :' +
                                    widget.data.data![widget.index].dogrucevap
                                : '',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
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
      ),
    );
  }

  degerlerisifirla() {
    btnrenk['a'] = Colors.indigoAccent;
    btnrenk['b'] = Colors.indigoAccent;
    btnrenk['c'] = Colors.indigoAccent;
    btnrenk['d'] = Colors.indigoAccent;
    btnrenk['e'] = Colors.indigoAccent;
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
              // cevapverildi = false;
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
              //   cevapverildi = false;
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
