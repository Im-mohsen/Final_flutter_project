import 'package:flutter/material.dart';
import 'pages/profile.dart';
import 'pages/admin_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = '', password = '';

  void _login() {
    if (user == 'reza' && password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else if (user == 'mohsen' && password == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('نام کاربری یا رمز عبور اشتباه است')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: Center(
        child: Container(
          height: 280,
          width: 300,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 3, 99),
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                TextField(
                  onChanged: (value) => user = value,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'نام کاربری',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'نام کاربری خود را وارد کنید',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Color.fromARGB(255, 86, 86, 86),
                  ),
                ),
              const SizedBox(height: 30),
                TextField(
                  onChanged: (value) => password = value,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'رمز عبور',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'رمز عبور را وارد کنید',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Color.fromARGB(255, 86, 86, 86),
                  ),
                ),
              const SizedBox(height: 30),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 40, 40, 40),
                  ),
                  onPressed: _login,
                    child: const Text(
                    'ورود به حساب',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), // Change this to your desired color
                    ),
                    ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
