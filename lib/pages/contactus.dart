import 'package:flutter/material.dart';

class ContactusPage extends StatelessWidget {
  const ContactusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ارتباط با ما')),
      body: const Center(child: Text('راه های ارتباطی اینجاست')),
    );
  }
}