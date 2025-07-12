import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پروفایل کاربر')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('../assets/images/default_profile.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'محسن دارابی',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            ProfileButton(title: 'سفارش‌های من', icon: Icons.shopping_bag),
            ProfileButton(title: 'آدرس‌های من', icon: Icons.location_on),
            ProfileButton(title: 'تنظیمات حساب', icon: Icons.settings),
            ProfileButton(title: 'پشتیبانی', icon: Icons.support_agent),
            ProfileButton(title: 'خروج از حساب', icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
        },
      ),
    );
  }
}
