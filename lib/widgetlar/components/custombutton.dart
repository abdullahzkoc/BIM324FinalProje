import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String Metin;
  final VoidCallback TiklamaFonksiyonu;

  const CustomButton({
    super.key, 
    required this.Metin, 
    required this.TiklamaFonksiyonu
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: TiklamaFonksiyonu,
      child: Text(Metin, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}