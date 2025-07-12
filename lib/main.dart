import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/products_page.dart';
import 'pages/cart_page.dart';
import 'pages/admin_page.dart';
import 'pages/profile.dart';
import 'pages/aboutus.dart';
import 'pages/contactus.dart';
import 'login.dart';
import 'pages/categories.dart';
import 'pages/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فروشگاه دمو',
      theme: ThemeData(
        fontFamily: 'Vazir',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'فروشگاه اینترنتی'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final GlobalKey _fabKey = GlobalKey();
  
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void _showCartBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                controller: scrollController,
                children: const [
                  Text(
                    '🛒 سبد خرید شما',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 12),
                  ListTile(
                    title: Text('محصول ۱'),
                    trailing: Text('۱ عدد'),
                  ),
                  ListTile(
                    title: Text('محصول ۲'),
                    trailing: Text('۲ عدد'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  void _showNotificationsBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                controller: scrollController,
                children: const [
                  Text(
                    '🔔 اعلانات شما',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 12),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('پیام ۱: تخفیف ویژه'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('پیام ۲: ارسال رایگان برای خرید بالای ۵۰۰ هزار تومان'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('پیام ۳: محصول جدید اضافه شد'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  void _showSearchBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '🔎 جستجو',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 16),
              TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'نام محصول را وارد کنید...',
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  print('در حال جستجو: $value');
                },
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 244, 3, 99),
        actions: [
          IconButton(
            onPressed: _showSearchBottomSheet,
            icon: const Icon(Icons.search),
            tooltip: 'جستجو',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'اعلانات',
            onPressed: _showNotificationsBottomSheet,
          ),
          IconButton(
            onPressed: _showCartBottomSheet,
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'سبد خرید',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: _fabKey,
        backgroundColor: const Color.fromARGB(255, 244, 3, 99),
        onPressed: () async {
          final RenderBox renderBox = _fabKey.currentContext!.findRenderObject() as RenderBox;
          final Size size = renderBox.size;
          final Offset offset = renderBox.localToGlobal(Offset.zero);

          final selected = await showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(
              offset.dx,
              offset.dy,
              MediaQuery.of(context).size.width - offset.dx - size.width,
              0,
            ),
            items: [
              const PopupMenuItem<String>(
                value: 'products',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('محصولات', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'cart',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('سبد خرید', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'admin',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('پنل ادمین', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'profile',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('پروفایل', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'contactus',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('ارتباط با ما', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'aboutus',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('درباره ما', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'login',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('ورود', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'categories',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('دسته بندی', textDirection: TextDirection.rtl),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'product_details',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('جزئیات محصول', textDirection: TextDirection.rtl),
                ),
              ),
            ],
          );

          if (selected == 'products') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsPage()));
          } else if (selected == 'cart') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
          } else if (selected == 'admin') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPage()));
          }else if (selected == 'profile') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
          }else if (selected == 'contactus') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactusPage()));
          } else if (selected == 'aboutus') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutusPage()));
          } else if (selected == 'login') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else if (selected == 'categories') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoriesPage()));
          } else if (selected == 'product_details') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductDetailsPage()));
          }

        },
        tooltip: 'منو',
        child: const Icon(Icons.menu),
      ),
    );
  }
}
