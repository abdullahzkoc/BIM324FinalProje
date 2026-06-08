import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String Baslik;
  final String Altbaslik;
  final String ResimYolu; 
  final VoidCallback TiklamaFonksiyonu;

  const CustomCard({
    super.key,
    required this.Baslik,
    required this.Altbaslik,
    required this.ResimYolu,
    required this.TiklamaFonksiyonu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias, // Köşelerden taşmayı kesin olarak önler
      child: InkWell(
        onTap: TiklamaFonksiyonu,
        child: Row(
          children: [
            // Resim Alanı
            Container(
              width: 100,
              height: 100,
              color: Colors.grey.shade200,
              child: Image.network(
                ResimYolu, 
                fit: BoxFit.cover, 
                // Eğer resim yüklenemezse hata vermek yerine bir ikon gösterir
                errorBuilder: (context, Hata, StackTrace) => const Icon(Icons.sports_soccer, size: 40, color: Colors.indigo),
              ),
            ),
            // Metin Alanı (Expanded ile yazının ekrandan taşması önlenir)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Baslik, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18), 
                      maxLines: 1, 
                      overflow: TextOverflow.ellipsis // Sığmazsa sonuna ... koyar
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Altbaslik, 
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14), 
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}