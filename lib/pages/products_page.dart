import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_details.dart';

class ProductsPage extends StatelessWidget {
  final String categoryTitle;

  const ProductsPage({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    // لیست همه محصولات
    final List<Product> allProducts = [
      Product(
        title: 'گوشی سامسونگ A52',
        image: '../assets/images/a52.jpg',
        price: 12000000,
        discount: 10,
        category: 'موبایل و تبلت',
      ),
      Product(
        title: 'گوشی شیائومی Note 11',
        image: '../assets/images/note11.jpg',
        price: 9500000,
        category: 'موبایل و تبلت',
      ),
      Product(
        title: 'لپ‌تاپ لنوو',
        image: '../assets/images/lenovo.png',
        price: 25000000,
        category: 'لپ‌تاپ و کامپیوتر',
      ),
      Product(
        title: 'کنسول PS5',
        image: '../assets/images/ps5.jpg',
        price: 33000000,
        category: 'کنسول بازی',
      ),
    ];

    // فیلتر محصولات بر اساس دسته انتخاب‌شده
    final filteredProducts = allProducts
        .where((product) => product.category == categoryTitle)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('دسته: $categoryTitle')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          final discountedPrice = product.discount != null
              ? (product.price * (100 - product.discount!) ~/ 100)
              : null;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                );
              },
              leading: Image.asset(product.image, width: 60, fit: BoxFit.cover),
              title: Text(product.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (discountedPrice != null)
                    Text(
                      '${product.price} تومان',
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    '${discountedPrice ?? product.price} تومان',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
