import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('جزئیات محصول')),
      body: const Center(child: Text('این صفحه جزئیات محصول است')),
    );
  }
}