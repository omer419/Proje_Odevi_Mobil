import 'package:flutter/material.dart';

void main() => runApp(GmailMinimalApp());

class GmailMinimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Gmail UI',
      debugShowCheckedModeBanner: false,
      home: GmailMinimalHome(),
    );
  }
}

class GmailMinimalHome extends StatefulWidget {
  @override
  _GmailMinimalHomeState createState() => _GmailMinimalHomeState();
}

class _GmailMinimalHomeState extends State<GmailMinimalHome> {
  final List<Map<String, String>> mails = [
    {
      'sender': 'B',
      'subject': 'Basın Koordinatörlüğü Proje deneyimleri',
      'snippet': 'Proje Destek Ve Yönetim Koordinatörlüğü',
    },
    {
      'sender': 'G',
      'subject': 'GRÜ Merkez Kütüphanesi',
      'snippet': 'Merhabalar, TUBITAK ULAKABİM+ WILEY AÇ...',
    },
    {
      'sender': 'T',
      'subject': 'Trendyol Go',
      'snippet': 'Yemek Siparişini Aldık Siparişin Onaylandı.',
    },
    {
      'sender': 'M',
      'subject': 'Midas Gündem',
      'snippet': 'Türk Ekonomisine Güven Artıyor Yurt içi Piyasalarda,TCMB...',
    },
    {
      'sender': 'N',
      'subject': 'NETFLİX',
      'snippet':
          'Merhaba Pol Formula 1: Drive to Survive 6. Sezon Şimdi Netflix de ',
    },
    {
      'sender': 'B',
      'subject': 'Binance TR Şifreyi Sıfırla',
      'snippet': 'Şifreyi Sıfırla Değerli Kullanıcımız,!Binance...',
    },
    {
      'sender': 'E',
      'subject': 'EA Welcome to Your EA Account',
      'snippet': 'EA View online click here. Welcome to your...',
    },
    {
      'sender': 'M',
      'subject': 'Microsoft',
      'snippet': 'Verilerinize erişen yeni uygulamalar var.',
    },
  ];

  // Favori durumlarını tutan liste
  late List<bool> isStarred;

  @override
  void initState() {
    super.initState();
    isStarred = List<bool>.filled(mails.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Gmail'),
        actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: ListView.builder(
        itemCount: mails.length,
        itemBuilder: (context, index) {
          final mail = mails[index];
          return ListTile(
            leading: CircleAvatar(child: Text(mail['sender']![0])),
            title: Text(mail['subject']!),
            subtitle: Text(mail['snippet']!),
            trailing: IconButton(
              icon: Icon(
                isStarred[index] ? Icons.star : Icons.star_border,
                color: isStarred[index] ? Colors.amber : null,
              ),
              onPressed: () {
                setState(() {
                  isStarred[index] = !isStarred[index];
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.edit),
      ),
    );
  }
}
