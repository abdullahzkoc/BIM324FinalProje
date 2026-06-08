import 'package:flutter/material.dart';
import '../modeller/spormodeli.dart';
import '../widgetlar/components/custombutton.dart';

class DetayEkrani extends StatelessWidget {
  final SporModeli Gecerlispor;

  const DetayEkrani({super.key, required this.Gecerlispor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Gecerlispor.SporAdi, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade200,
              child: Image.network(
                Gecerlispor.ResimUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, Hata, StackTrace) => const Icon(Icons.image, size: 80, color: Colors.indigo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Gecerlispor.SporAdi,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    Gecerlispor.Aciklama,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    Metin: 'Yönetim Modülüne Katıl',
                    TiklamaFonksiyonu: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${Gecerlispor.SporAdi} sistemine erişim sağlandı!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}