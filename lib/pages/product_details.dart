import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final discountedPrice = product.discount != null
        ? (product.price * (100 - product.discount!) ~/ 100)
        : null;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, height: 200),
            const SizedBox(height: 16),
            Text(product.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (discountedPrice != null)
              Text('${product.price} تومان',
                  style: const TextStyle(
                      color: Colors.grey, decoration: TextDecoration.lineThrough)),
            Text('${discountedPrice ?? product.price} تومان',
                style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            const Text(
              'توضیحات کامل محصول اینجا قرار می‌گیرد...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
