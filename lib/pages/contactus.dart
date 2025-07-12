import 'package:flutter/material.dart';

class ContactusPage extends StatefulWidget {
  const ContactusPage({super.key});

  @override
  State<ContactusPage> createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  final _formKey = GlobalKey<FormState>();
  String messageType = 'انتقاد';
  String message = '';

  final List<String> messageTypes = ['انتقاد', 'پیشنهاد', 'شکایت', 'سایر'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('پیام شما با موفقیت ارسال شد')),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ارتباط با ما')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'راه‌های ارتباطی با ما:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('📞 تلفن: 051-42222222'),
            const Text('📧 ایمیل: mohsen@example.com'),
            const Text('📍 آدرس: نیشابور دانشگاه آزاد اسلامی'),
            const SizedBox(height: 32),

            const Text(
              'ارسال پیام:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: messageType,
                    decoration: const InputDecoration(
                      labelText: 'نوع پیام',
                      border: OutlineInputBorder(),
                    ),
                    items: messageTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        messageType = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'متن پیام',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً متن پیام را وارد کنید';
                      }
                      return null;
                    },
                    onSaved: (value) => message = value ?? '',
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('ارسال'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}