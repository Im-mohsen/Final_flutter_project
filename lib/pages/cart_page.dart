import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final List<Map<String, dynamic>> cartItems = const [
    {
      'title': 'a52 گوشی موبایل سامسونگ',
      'price': 12500000,
      'quantity': 1,
      'image': '../assets/images/a52.jpg',
    },
    {
      'title': 'کنسول بازی PS5',
      'price': 25000000,
      'quantity': 2,
      'image': '../assets/images/Ps5.jpg',
    },
  ];

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      total += ((item['price'] as num) * (item['quantity'] as num)).toInt();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🛒 سبد خرید')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,
              padding: const EdgeInsets.all(12),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item['title']),
                    subtitle: Text('${item['quantity']} عدد'),
                    trailing: Text(
                      '${item['price'] * item['quantity']} تومان',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: const Border(
                top: BorderSide(color: Colors.black12),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('جمع کل:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${getTotalPrice()} تومان',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 244, 3, 99))),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // فعلاً عملکرد ندارد
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('پرداخت انجام نشد (دمو) 💳'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor:const Color.fromARGB(255, 244, 3, 99),
                    ),
                    child: const Text(
                      'نهایی‌سازی سفارش',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
