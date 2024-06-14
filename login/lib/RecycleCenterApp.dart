import 'package:flutter/material.dart';

void main() {
  runApp(RecycleCenterApp());
}

class RecycleCenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycle Center',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DistrictSelectionScreen(),
    );
  }
}

class DistrictSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Recycle Centers')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Esenler');
                  },
                  child: Text('Esenler'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Şişli');
                  },
                  child: Text('Şişli'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Ataşehir');
                  },
                  child: Text('Ataşehir'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Kağıthane');
                  },
                  child: Text('Kağıthane'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Ümraniye');
                  },
                  child: Text('Ümraniye'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Güngören');
                  },
                  child: Text('Güngören'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Eyüpsultan');
                  },
                  child: Text('Eyüpsultan'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Beyoğlu');
                  },
                  child: Text('Beyoğlu'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Başakşehir');
                  },
                  child: Text('Başakşehir'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Kadıköy');
                  },
                  child: Text('Kadıköy'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Esenyurt');
                  },
                  child: Text('Esenyurt'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Bayrampaşa');
                  },
                  child: Text('Bayrampaşa'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToRecycleCenterScreen(context, 'Bahçelievler');
                  },
                  child: Text('Bahçelievler'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigateToRecycleCenterScreen(BuildContext context, String selectedDistrict) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecycleCenterScreen(selectedDistrict: selectedDistrict),
      ),
    );
  }
}

class RecycleCenterScreen extends StatelessWidget {
  final String selectedDistrict;

  RecycleCenterScreen({required this.selectedDistrict});

  @override
  Widget build(BuildContext context) {
    String centerName = '';
    String address = '';
    String phoneNumber = '';
    String website = '';
    String email = '';

    if (selectedDistrict == 'Esenler') {
      centerName = 'Esenler Municipality Recycling Transfer Center';
      address = 'Oruçreis, Ipekyolu Cd NO:11, 34230 Esenler/Istanbul';
      phoneNumber = '(0212) 629 96 73';
      website = 'http://www.istanbulgeridonusum.com.tr/';
      email = 'info@istanbulgeridonusum.com.tr';
    } else if (selectedDistrict == 'Şişli') {
      centerName = 'Recycling Center';
      address = 'Merkez, Harzemşah Sk. 9/a, 34050 Şişli/Istanbul';
      phoneNumber = '547 939 02 74';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Beyoğlu') {
      centerName = 'European Side Scrap Recycling Center Service Point';
      address = 'Firuzağa, Cihangir Sauna, Türkgücü Cd. No: 24/3, 34425 Beyoğlu/Istanbul';
      phoneNumber = '0552 644 77 75';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Başakşehir') {
      centerName = 'Recycling Center';
      address = 'Şahintepe, Aşık Veysel Cd., 34494 Başakşehir/Istanbul';
      phoneNumber = '0532 631 63 62';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Bayrampaşa') {
      centerName = 'Plastic Recycling';
      address = 'Vatan, Emel Sk. No:11, 34035 Bayrampaşa/Istanbul';
      phoneNumber = '0539 794 09 28';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Bahçelievler') {
      centerName = 'KALEM Recycling';
      address = 'Zafer, Bahargülü Sk. No:18 D:1, 34194 Bahçelievler/Istanbul';
      phoneNumber = '0535 832 96 07';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Kağıthane') {
      centerName = 'Doğanay Recycling';
      address = 'Yeşilce, Seçilmiş Sk. No:4, 34418 Kağıthane/Istanbul';
      phoneNumber = 'Unknown';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Ümraniye') {
      centerName = 'Recycling Trash Bin';
      address = 'Tatlısu, Nurettin Duman Sk. No:12/C, 34774 Ümraniye/Istanbul';
      phoneNumber = '(0216) 466 68 00';
      website = 'https://geridonusumkovasi.com/';
      email = 'info@efesteel.com';
    } else if (selectedDistrict == 'Ataşehir') {
      centerName = 'Özkan Recycling';
      address = 'Aşık Veysel, 3027. Sk. No:16, 34707 Ataşehir/Istanbul';
      phoneNumber = '(0212) 886 13 35';
      website = 'http://ozkangeridonusum.com/iletisim.html';
      email = 'info@ozkangeridonusum.com';
    } else if (selectedDistrict == 'Esenyurt') {
      centerName = 'Obalılar Recycling';
      address = 'Akçaburgaz, 1632. Sk. No:38, 34517 Esenyurt/Istanbul';
      phoneNumber = '(0212) 886 61 61';
      website = 'http://www.obalilar.com.tr/';
      email = 'Unknown';
    } else if (selectedDistrict == 'Kadıköy') {
      centerName = 'Aslan Recycling';
      address = 'Fikirtepe, Dispanser Sk. no:9, 34720 Kadıköy/Istanbul';
      phoneNumber = '0532 514 21 20';
      website = 'Unknown';
      email = 'Unknown';
    } else if (selectedDistrict == 'Güngören') {
      centerName = 'ync Recycling';
      address = 'Sanayi, Orpak Sk. No:16, 34160 Güngören/Istanbul';
      phoneNumber = '0532 778 99 25';
      website = 'https://yncgeridonusum.com/';
      email = 'info@yncgeridonusum.com';
    } else if (selectedDistrict == 'Eyüpsultan') {
      centerName = 'Tarhan Recycling';
      address = 'Eyüp Merkez, Bahçeli Sk. No:3, 34055 Eyüpsultan/Istanbul';
      phoneNumber = 'Unknown';
      website = 'Unknown';
      email = 'Unknown';
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Recycle Center Information')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Center Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(centerName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(address, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Contact Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(phoneNumber, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Website:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(website, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Email Address:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(email, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
