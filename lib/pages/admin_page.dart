import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پنل ادمین')),
      body: const Center(child: Text('پنل مدیریت برای ادمین')),
    );
  }
}
