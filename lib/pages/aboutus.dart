import 'package:flutter/material.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('درباره ما')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('../assets/images/techsano.png'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'تیم طراحی تکسانو',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'این اپلیکیشن به عنوان یک نمونه فروشگاه اینترنتی برای درس فلاتر طراحی شده است. هدف از ساخت این برنامه، آشنایی با مفاهیم پایه فلاتر از جمله طراحی رابط کاربری، ناوبری بین صفحات، مدیریت حالت، و سازماندهی فایل‌ها بوده است.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'ویژگی‌ها:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• نمایش محصولات براساس دسته‌بندی'),
            Text('• صفحه جزئیات محصول'),
            Text('• ورود کاربران و ادمین'),
            Text('• نوار بالا با گزینه‌های جستجو، سبد خرید و اعلان'),
            Text('• راست‌چین و مناسب زبان فارسی'),
            SizedBox(height: 20),
            Center(
              child: Text(
                'تشکر بابت همراهی شما ❤️',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}