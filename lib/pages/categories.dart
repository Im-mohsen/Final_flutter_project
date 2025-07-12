import 'package:flutter/material.dart';
import 'products_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'موبایل و تبلت', 'icon': Icons.smartphone},
    {'title': 'لپ‌تاپ و کامپیوتر', 'icon': Icons.laptop_mac},
    {'title': 'لوازم جانبی', 'icon': Icons.headphones},
    {'title': 'تلویزیون و صوتی تصویری', 'icon': Icons.tv},
    {'title': 'کنسول بازی', 'icon': Icons.videogame_asset},
    {'title': 'ساعت هوشمند', 'icon': Icons.watch},
    {'title': 'دوربین و تجهیزات عکاسی', 'icon': Icons.photo_camera},
    {'title': 'سیستم‌های ذخیره‌سازی', 'icon': Icons.sd_storage},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دسته‌بندی محصولات'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const Divider(height: 20),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            leading: Icon(category['icon'], color: Colors.deepPurple),
            title: Text(
              category['title'],
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPage(
                    categoryTitle: category['title'], // ارسال عنوان دسته
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
