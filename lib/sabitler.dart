import 'dart:ui';

import 'package:flutter/material.dart';

String kpssgenelanabanner = 'ca-app-pub-3535745534592900/5713575033';
String kpsstarihkonuanabanner = 'ca-app-pub-3535745534592900/3202676352';
String kpsscografyakonuanabanner = 'ca-app-pub-3535745534592900/3857282478';
String kpssturkcekonuanabanner = 'ca-app-pub-3535745534592900/7815874633';
String kpssvatankonuanabanner = 'ca-app-pub-3535745534592900/7815874633';
String kpssgenelguncelkonuanabanner = 'ca-app-pub-3535745534592900/1111699639';
String kpssgenelguncelgecis = 'ca-app-pub-3535745534592900/7402061221';
String kpssgenelguncelkonudetaybanner =
    'ca-app-pub-3535745534592900/4775897883';
String kpssgenelguncelsorugecis = 'ca-app-pub-3535745534592900/9896077211';
String kpssgeneltarihrastgelesorubanner =
    'ca-app-pub-3535745534592900/1027228716';
String kpssgeneltarihrastgelesorugecis =
    'ca-app-pub-3535745534592900/1335184628';

String kpssgenerastgelenotlarbanner = 'ca-app-pub-3535745534592900/8629003679';
String kpssgenerastgelenotgecis = 'ca-app-pub-3535745534592900/7029244877';

String islamiyet_oncesi = '';

Map<String, Color> btnrenk = {
  "a": Colors.indigoAccent,
  "b": Colors.indigoAccent,
  "c": Colors.indigoAccent,
  "d": Colors.indigoAccent,
  "e": Colors.indigoAccent,
};

List<String> tarihkonular = [
  'boş',
  'İslamiyet Öncesi Türk Tarihi',
  'İlk Müslüman Türk Devletleri ve Beylikler',
  'Türkiye Tarihi Konu Anlatımı',
  'Osmanlı Kuruluş Kültür ve Medeniyet',
  'Osmanlı Devleti Duraklama Dönemi',
  'Osmanlı Devleti Gerileme Dönemi',
  'Avrupa Tarihi',
  'Osmanlı Devleti Çöküş ve Dağılma Dönemi',
  '20. Yüzyılda Osmanlı Devleti',
  'I. Dünya Savaşı ve Cemiyetler',
  'Kurtuluş Savaşı Hazırlık Kongreler Dönemi',
  'I. TBMM Dönemi',
  'Kurtuluş Savaşı Muharebeler Dönemi',
  'Cumhuriyet Dönemi Partiler ve İnkilaplar',
  'Atatürk İlkeleri – Konu ve Çıkmış Sorular',
  'Cumhuriyet Dönemi Dış Politika',
  'II. Dünya Savaşı ve Sonraki Dönem',
  ' Çağdaş Türk ve Dünya Tarihi',
  'İç Politika',
];

List<String> adresler = [
  'boş',
  'https://www.kpssmobilensf.com/kpss-tarih-islamiyet-oncesi-turk-tarihi/',
  'https://www.kpssmobilensf.com/kpss-ilk-musluman-turk-devletleri-ve-beylikler/',
  'https://www.kpssmobilensf.com/turkiye-tarihi-konu-anlatimi/',
  'https://www.kpssmobilensf.com/osmanli-kurulus-kultur-ve-medeniyet/',
  'https://www.kpssmobilensf.com/tarih-osmanli-devleti-duraklama-donemi/',
  'https://www.kpssmobilensf.com/osmanli-devleti-gerileme-donemi/',
  'https://www.kpssmobilensf.com/avrupa-tarihi/',
  'https://www.kpssmobilensf.com/osmanli-devleti-cokus-ve-dagilma-donemi/',
  'https://www.kpssmobilensf.com/20-yuzyilda-osmanli-devleti/',
  'https://www.kpssmobilensf.com/i-dunya-savasi-ve-cemiyetler/',
  'https://www.kpssmobilensf.com/kurtulus-savasi-hazirlik-kongreler-donemi/',
  'https://www.kpssmobilensf.com/i-tbmm-donemi/',
  'https://www.kpssmobilensf.com/kurtulus-savasi-muharebeler-donemi/',
  'https://www.kpssmobilensf.com/cumhuriyet-donemi-partiler-ve-inkilaplar/',
  'https://www.kpssmobilensf.com/ataturk-ilkeleri/',
  'https://www.kpssmobilensf.com/cumhuriyet-donemi-dis-politika/',
  'https://www.kpssmobilensf.com/ii-dunya-savasi-ve-sonraki-donem/',
  'https://www.kpssmobilensf.com/cagdas-turk-ve-dunya-tarihi/',
  'https://www.kpssmobilensf.com/ic-politika/'
];

List<String> tarihnotlar = [
  'boş',
  'İslamiyet Öncesi Türk Tarihi – 255 Madde',
  'İlk Müslüman Türk Devletleri ve Beylikler',
  'Osmanlı Devleti Kültür ve Medeniyeti',
  'Osmanlı Devleti Kuruluş ve Yükselme Dönemi',
  'Osmanlı Devleti Duraklama Dönemi',
  'Osmanlı Devleti Gerileme Dönemi',
  'Osmanlı Devleti Dağılma ve Islahatlar Dönemi',
  '20. Yüzyıl Osmanlı Devleti',
  'Avrupa Tarihi',
  'I.TBMM Dönemi',
  'Milli Mücadele Hazırlık Dönemi',
  'Milli Mücadele Muharebeler Dönemi',
  'Atatürk İlkeleri',
  'Atatürk İnkilapları',
  'Atatürk Dönemi Türk Dış Politikası ve Atatürk Sonrası Dönem',
  'Türk Tarihi Kronolojisi',
  'Osmanlı Tarihi Kronolojisi',
  'İnkilap Tarihi Kronolojisi',
  'Türk İslam ve Osmanlı Mimari Eserleri',
  'Türk Tarihinde İlkler',
  'Osmanlı Devleti Tarihinde İlkler',
  'Kpss Tarih Tanımları – Tarih Terimleri Sözlüğü',
  'Tarih Edebiyat – Bilim – Sanat – Din – Edebiyat İnsanları',
  'Tüm Osmanlı Dönemi Antlaşmaları (Kronolojik Sıra İle) 1416 – 1920',
  'Kpss Tarih Şifre Ters Köşe Kartları – 250 Adet',
  'Kpss Tarih Şifreleri – Kısa Kodlamaları',
  'Atatürk’ün 15 Yılda Kurduğu Fabrikalar',
  'Ramazan Yetgin Tarih Notları',
  'Çağdaş Dünya Tarihi Özet',
];

List<String> adreslernot = [
  'boş',
  'https://www.kpssmobilensf.com/islamiyet-oncesi-turk-tarihi-notlar/',
  'https://www.kpssmobilensf.com/ilk-musluman-turk-devletleri-ve-beylikler/',
  'https://www.kpssmobilensf.com/osmanli-devleti-kultur-ve-medeniyeti/',
  'https://www.kpssmobilensf.com/osmanli-devleti-kurulus-ve-yukselme-donemi/',
  'https://www.kpssmobilensf.com/osmanli-devleti-duraklama-donemi/',
  'https://www.kpssmobilensf.com/osmanli-devleti-gerileme-donemi-2/',
  'https://www.kpssmobilensf.com/osmanli-devleti-dagilma-ve-islahatlar-donemi/',
  'https://www.kpssmobilensf.com/20-yuzyil-osmanli-devleti/',
  'https://www.kpssmobilensf.com/avrupa-tarihi-2/',
  'https://www.kpssmobilensf.com/i-tbmm-donemi-2/',
  'https://www.kpssmobilensf.com/milli-mucadele-hazirlik-donemi/',
  'https://www.kpssmobilensf.com/milli-mucadele-muharebeler-donemi/',
  'https://www.kpssmobilensf.com/ataturk-ilkeleri-2/',
  'https://www.kpssmobilensf.com/ataturk-inkilaplari/',
  'https://www.kpssmobilensf.com/ataturk-donemi-turk-dis-politikasi-ve-ataturk-sonrasi-donem/',
  'https://www.kpssmobilensf.com/turk-tarihi-kronolojisi-islam-oncesi-ilk-islam/',
  'https://www.kpssmobilensf.com/osmanli-tarihi-kronolojisi/',
  'https://www.kpssmobilensf.com/inkilap-tarihi-kronolojisi/',
  'https://www.kpssmobilensf.com/turk-islam-ve-osmanli-mimari-eserleri/',
  'https://www.kpssmobilensf.com/turk-tarihinde-ilkler/',
  'https://www.kpssmobilensf.com/osmanli-devleti-tarihinde-ilkler/',
  'https://www.kpssmobilensf.com/kpss-tarih-tanimlari-tarih-terimleri-sozlugu/',
  'https://www.kpssmobilensf.com/tarih-edebiyat-bilim-sanat-din-edebiyat-insanlari/',
  'https://www.kpssmobilensf.com/tum-osmanli-donemi-antlasmalari-kronolojik-sira-ile-1416-1920/',
  'https://www.guncelkpssbilgi.com/tarih-ters-kose-kartlari/',
  'https://www.guncelkpssbilgi.com/tarih-sifreleri/',
  'https://www.kpssmobilensf.com/ataturkun-15-yilda-kurdugu-fabrikalar/',
  'https://www.kpssmobilensf.com/ramazan-yetgin-tarih-notlari/',
  'https://www.kpssmobilensf.com/cagdas-dunya-tarihi-ozet/',
  '',
];

List<String> tarihsorular = [
  'boş',
  ' İslamiyet Öncesi Türk Tarihi Denemesi – 1',
  'Türk İslam Tarihi Deneme Sınavı',
  'Osmanlı Devleti Deneme Sınavı  1',
  'Osmanlı Devleti Deneme Sınavı -2',
  'Osmanlı Devleti Deneme Sınavı -3',
  'Osmanlı Devleti Deneme Sınavı -4',
  'Osmanlı Devleti Deneme Sınavı -5',
  'Osmanlı Kültür ve Medeniyeti Deneme Sınavı – 1',
  'Osmanlı Kültür ve Medeniyeti Deneme Sınavı – 2',
  'Osmanlı Kültür ve Medeniyeti Deneme Sınavı 3',
  'Osmanlı Duraklama Devri – Test ',
  'Osmanlı Devleti Gerileme Dönemi – Test',
  'Osmanlı Devleti Dağılma Dönemi – Test',
  'Osmanlı Devleti Deneme Sınavı -6',
  'Osmanlı Islahatları Deneme',
  '20. yy. Başlarında Osmanlı Devleti',
  'Türkiye Tarihi Deneme Sınavı',
  'Atatürk ile ilgili 20 Soru',
  'Atatürk Dönemi Dış Politika',
  'İnkilap Tarihi Deneme Sınavı',
  'Atatürk İlkeleri – Deneme',
  '100 Soru ile Kpss Milli Mücadele Dönemi',
  '250 Soru İle Çağdaş Türk ve Dünya Tarihi',
  '100 Soru ile İslamiyet Öncesi Türk Tarihi',
  '75 Soru ile Osmanlı Islahatları',
  '150 Soru ile Tarih – Türk – İslam Devletleri',
  '250 Soru ile Osmanlı Kültür ve Medeniyeti',
  '300 Soruda Osmanlı Tarihi',
  '75 Soru İle Türkiye Tarihi Tekrarı'
];

List<String> adreslertarihsoru = [
  'boş',
  'https://www.kpssmobilensf.com/islamiyet-oncesi-turk-tarihi-denemesi/',
  'https://www.kpssmobilensf.com/turk-islam-tarihi-deneme-sinavi/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-1/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-2/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-3/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-4/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-5/',
  'https://www.kpssmobilensf.com/osmanli-kultur-ve-medeniyeti-deneme-sinavi-1/',
  'https://www.kpssmobilensf.com/osmanli-kultur-ve-medeniyeti-deneme-sinavi-2/',
  'https://www.kpssmobilensf.com/osmanli-kultur-ve-medeniyeti-deneme-sinavi-3/',
  'https://www.kpssmobilensf.com/osmanli-duraklama-devri-test/',
  'https://www.kpssmobilensf.com/osmanli-devleti-gerileme-donemi-test/',
  'https://www.kpssmobilensf.com/osmanli-devleti-dagilma-donemi-test/',
  'https://www.kpssmobilensf.com/osmanli-devleti-deneme-sinavi-6/',
  'https://www.kpssmobilensf.com/osmanli-islahatlari-deneme/',
  'https://www.kpssmobilensf.com/20-yy-baslarinda-osmanli-devleti/',
  'https://www.kpssmobilensf.com/turkiye-tarihi-deneme-sinavi/',
  'https://www.kpssmobilensf.com/ataturk-ile-ilgili-20-soru/',
  'https://www.kpssmobilensf.com/ataturk-donemi-dis-politika/',
  'https://www.kpssmobilensf.com/inkilap-tarihi-deneme-sinavi/',
  'https://www.kpssmobilensf.com/ataturk-ilkeleri-deneme/',
  'https://www.kpssmobilensf.com/100-soru-ile-kpss-milli-mucadele-donemi/',
  'https://www.kpssmobilensf.com/250-soru-ile-cagdas-turk-ve-dunya-tarihi/',
  'https://www.kpssmobilensf.com/100-soru-ile-i%cc%87slamiyet-oncesi-turk-tarihi/',
  'https://www.kpssmobilensf.com/75-soru-ile-osmanli-islahatlari/',
  'https://www.kpssmobilensf.com/150-soru-ile-tarih-turk-islam-devletleri/',
  'https://www.kpssmobilensf.com/250-soru-ile-osmanli-kultur-ve-medeniyeti/',
  'https://www.kpssmobilensf.com/300-soruda-osmanli-tarihi/',
  'https://www.kpssmobilensf.com/75-soru-ile-turkiye-tarihi-tekrari/'
];

List<String> taridenemeler = [
  'boş',
  ' Tarih  Deneme -Sınavı – 1',
  'Tarih  Deneme -Sınavı – 2',
  'Tarih Deneme -Sınavı – 3',
  'Tarih Deneme -Sınavı – 4',
  'Tarih Deneme -Sınavı – 5',
  'Tarih Deneme -Sınavı – 6',
  'Tarih Deneme -Sınavı – 7',
  'Tarih Deneme Sınavı – 8',
  'Tarih Deneme Sınavı – 9',
  'Tarih Deneme Sınavı – 10',
  'Tarih Deneme Sınavı – 11',
  'Tarih Deneme Sınavı – 12',
  'Tarih Deneme Sınavı – 13',
  'Tarih Deneme Sınavı – 14',
  'Tarih Deneme Sınavı – 15',
  'Tarih Deneme Sınavı – 16',
  'Tarih Deneme Sınavı – 17'
];

List<String> adreslertarideneme = [
  'boş',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-1/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-2/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-3/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-3-2/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-5/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-6/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-7/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-8/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-9/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-10/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-11/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-12/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-13/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-14/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-15/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-16/',
  'https://www.kpssmobilensf.com/tarih-deneme-sinavi-17/'
];

List<String> cografyakonular = [
  'boş',
  'Türkiyenin Coğrafi Konumu ',
  'Türkiyenin Fiziki Coğrafyası ',
  'Türkiyenin Ekonomik Coğrafyası ',
  'Türkiyenin Coğrafi Bölgeleri',
  'Türkiye Coğrafyası (Tüm Konular)',
  'Kpss Coğrafya Kitabı',
  'Kpss Coğrafya 140 Sayfa Konu Anlatımı'
];

List<String> cogadresler = [
  'boş',
  'https://www.kpssmobilensf.com/turkiyenin-cografi-konumu/',
  'https://www.kpssmobilensf.com/turkiyenin-fiziki-cografyasi/',
  'https://www.kpssmobilensf.com/turkiyenin-ekonomik-cografyasi/',
  'https://www.kpssmobilensf.com/turkiyenin-cografi-bolgeleri/',
  'https://www.kpssmobilensf.com/turkiye-cografyasi-tum-konular/',
  'https://www.kpssmobilensf.com/kpss-cografya-kitabi/',
  'https://www.kpssmobilensf.com/kpss-cografya-140-sayfa-konu-anlatimi/'
];

List<String> cografnotlar = [
  'boş',
  'Kpss Coğrafya Tüm Notlar',
  'Kpss Coğrafya 101 Önemli Madde',
  'Coğrafya Önemli Notlar ve Uyarılar ',
  'Coğrafya Şifreleri ve Kısa Kodlamaları (120 Adet)',
  'Coğrafya Şifreleri'
];

List<String> cogadreslernot = [
  'boş',
  'https://www.kpssmobilensf.com/kpss-cografya-tum-notlar/',
  'https://www.kpssmobilensf.com/kpss-cografya-101-onemli-madde/',
  'https://www.kpssmobilensf.com/cografya-onemli-notlar-ve-uyarilar/',
  'https://www.kpssmobilensf.com/cografya-sifreleri-ve-kisa-kodlamalari-120-adet/',
  'https://www.kpssmobilensf.com/cografya-sifreleri/'
];

List<String> cografsorular = [
  'boş',
  'Coğrafya Test 1 – 50 Soru',
  'Kpss Coğrafya İklim Tipleri- Test',
  'Coğrafya Göçler ve Nedenleri Test',
  'Dünyanın Şekli ve Hareketleri Test',
  'Akarsular ve Yeraltı Suları Test 1',
  'Türkiyenin Coğrafi Konumu Test 1',
  'Türkiyenin Fiziki Coğrafyası – Test 1',
  'Türkiyenin Beşeri Coğrafyası Test',
  'Türkiyede Yetiştirilen Ürünler Test',
  'Ulaşım Ticaret Turizm Test',
  'Türkiye Sanayi Test',
  'Hayvancılık ve Ormancılık Test',
  'Toprak Çeşitleri Test',
  'Coğrafya Bölgeler Testi',
  'Enerji Kaynakları Test',
  'Ulaşım ve Ticaret Test',
  'Türkiyenin Coğrafi Bölgeleri Test',
  'Kpss Coğrafya Soru Bankası'
];

List<String> cogadreslesoru = [
  'boş',
  'https://www.kpssmobilensf.com/cografya-test-1-50-soru/',
  'https://www.kpssmobilensf.com/kpss-cografya-iklim-tipleri-test/',
  'https://www.kpssmobilensf.com/cografya-gocler-ve-nedenleri-test/',
  'https://www.kpssmobilensf.com/dunyanin-sekli-ve-hareketleri-test/',
  'https://www.kpssmobilensf.com/akarsular-ve-yeralti-sulari-test-1/',
  'https://www.kpssmobilensf.com/turkiyenin-cografi-konumu-test-1/',
  'https://www.kpssmobilensf.com/turkiyenin-fiziki-cografyasi-test-1/',
  'https://www.kpssmobilensf.com/turkiyenin-beseri-cografyasi-test/',
  'https://www.kpssmobilensf.com/turkiyede-yetistirilen-urunler-test/',
  'https://www.kpssmobilensf.com/ulasim-ticaret-turizm-test/',
  'https://www.kpssmobilensf.com/turkiye-sanayi-test/',
  'https://www.kpssmobilensf.com/hayvancilik-ve-ormancilik-test/',
  'https://www.kpssmobilensf.com/toprak-cesitleri-test/',
  'https://www.kpssmobilensf.com/cografya-bolgeler-testi/',
  'https://www.kpssmobilensf.com/enerji-kaynaklari-test/',
  'https://www.kpssmobilensf.com/ulasim-ve-ticaret-test/',
  'https://www.kpssmobilensf.com/turkiyenin-cografi-bolgeleri-test/',
  'https://www.kpssmobilensf.com/kpss-cografya-soru-bankasi/'
];

List<String> cografdeneme = [
  'boş',
  'Coğrafya 100 Soru Deneme',
  'Coğrafya Online Deneme Sınavı 105 Soru'
];

List<String> cogadresledenemee = [
  'boş',
  'https://www.kpssmobilensf.com/cografya-100-soru-deneme/',
  'https://www.kpssmobilensf.com/cografya-online-deneme-sinavi-105-soru/'
];

List<String> vatankonu = [
  'boş',
  'Temel Hukuk Bilgisi',
  'Türk Anayasa Tarihi ',
  'Temel Hak ve Hürriyetler',
  'Kpss Vatandaşlık Kitabı'
];

List<String> vatankonuadres = [
  'boş',
  'https://www.kpssmobilensf.com/kpss-temel-hukuk-bilgisi/',
  'https://www.kpssmobilensf.com/turk-anayasa-tarihi/',
  'https://www.kpssmobilensf.com/temel-hak-ve-hurriyetler/',
  'https://www.kpssmobilensf.com/kpss-vatandaslik-kitabi/'
];

List<String> vatannot = [
  'boş',
  'Vatandaşlık Nokta Atışı Bilgiler',
  'Türk Anayasaları ve Özellikleri',
  'Vatandaşlık Hukuk Önemli Notlar',
  'Vatandaşlık 2017 Anayasa Değişiklikleri',
  'Vatandaşlık Yeni YARGI Ders Notları',
  'Vatandaşlık Yeni YASAMA Ders Notları',
  'Vatandaşlık Yeni YÜRÜTME Ders Notları'
];

List<String> vatannotadres = [
  'boş',
  'https://www.kpssmobilensf.com/vatandaslik-nokta-atisi-bilgiler/',
  'https://www.kpssmobilensf.com/turk-anayasalari-ve-ozellikleri/',
  'https://www.kpssmobilensf.com/vatandaslik-hukuk-onemli-notlar/',
  'https://www.kpssmobilensf.com/vatandaslik-2017-anayasa-degisiklikleri/',
  'https://www.kpssmobilensf.com/vatandaslik-yeni-yargi-ders-notlari/',
  'https://www.kpssmobilensf.com/vatandaslik-yeni-yasama-ders-notlari/',
  'https://www.kpssmobilensf.com/vatandaslik-yeni-yurutme-ders-notlari/'
];

List<String> vatansoru = [
  'boş',
  'Kpss Vatandaşlık Deneme Sınavı ',
  '100 Soru ile Kpss Anayasa Deneme Sınavı',
  '72 Soru İle Kpss Vatandaşlık Yürütme Deneme Sınavı',
  '54 Soru ile Kpss Vatandaşlık Yargı Deneme Sınavı',
  'Kpss Vatandaşlık Test'
];

List<String> vatansoruadres = [
  'boş',
  'https://www.kpssmobilensf.com/kpss-vatandaslik-deneme-sinavi/',
  'https://www.kpssmobilensf.com/100-soru-ile-kpss-anayasa-deneme-sinavi/',
  'https://www.kpssmobilensf.com/72-soru-ile-kpss-vatandaslik-yurutme-deneme-sinavi/',
  'https://www.kpssmobilensf.com/54-soru-ile-kpss-vatandaslik-yargi-deneme-sinavi/',
  'https://www.kpssmobilensf.com/kpss-vatandaslik-test/'
];

List<String> turkcekonu = [
  'boş',
  'Ses Bilgisi ',
  'Sözcükte ve Sözde Anlam',
  'Cümlede Anlam',
  'Paragraf',
  'Yazım Kuralları',
  'Noktalama İşaretleri',
  'Dil Bilgisi',
  'Türkçe Konu Analtım Kitabı'
];

List<String> turkcekonuadres = [
  'boş',
  'https://www.kpssmobilensf.com/ses-bilgisi/',
  'https://www.kpssmobilensf.com/sozcukte-ve-sozde-anlam/',
  'https://www.kpssmobilensf.com/cumlede-anlam/',
  'https://www.kpssmobilensf.com/paragraf/',
  'https://www.kpssmobilensf.com/yazim-kurallari/',
  'https://www.kpssmobilensf.com/noktalama-isaretleri/',
  'https://www.kpssmobilensf.com/dil-bilgisi/',
  'https://www.kpssmobilensf.com/turkce-konu-analtim-kitabi/'
];

List<String> turkcenotlar = [
  'boş',
  'Türkçe Ders Notları',
  'Türkçe Yazımı Karıştırılan Sözcükler',
  'Türkçeden Soru Kaçırmamanın Yolları',
  'Türkçe Yazım Kuralları'
];

List<String> turkcenotlaradres = [
  'boş',
  'https://www.kpssmobilensf.com/turkce-ders-notlari/',
  'https://www.kpssmobilensf.com/turkce-yazimi-karistirilan-sozcukler/',
  'https://www.kpssmobilensf.com/turkceden-soru-kacirmamanin-yollari/',
  'https://www.kpssmobilensf.com/turkce-yazim-kurallari/'
];
