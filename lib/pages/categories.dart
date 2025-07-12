import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دسته بندی')),
      body: const Center(child: Text('این صفحه دسته بندی است')),
    );
  }
}