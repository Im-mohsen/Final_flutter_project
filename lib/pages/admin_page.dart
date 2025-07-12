import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  void _showComingSoon(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title در دست توسعه است'),
        backgroundColor: Colors.grey[800],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final adminOptions = [
      {'title': 'مدیریت محصولات', 'icon': Icons.shopping_bag},
      {'title': 'مدیریت دسته‌ها', 'icon': Icons.category},
      {'title': 'سفارش‌ها', 'icon': Icons.receipt_long},
      {'title': 'کاربران', 'icon': Icons.people},
      {'title': 'گزارش‌ها', 'icon': Icons.bar_chart},
      {'title': 'تنظیمات', 'icon': Icons.settings},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('پنل مدیریت'),
        backgroundColor: const Color.fromARGB(255, 244, 3, 99),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: adminOptions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = adminOptions[index];
            return InkWell(
              onTap: () => _showComingSoon(context, item['title'] as String),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 3, 99),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'] as IconData, size: 48, color: Colors.white),
                    const SizedBox(height: 12),
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
