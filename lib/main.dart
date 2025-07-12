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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: PageView(
                  children: [
                    _buildBanner('../assets/images/banner1.png'),
                    _buildBanner('../assets/images/banner2.png'),
                    _buildBanner('../assets/images/banner3.png'),
                    _buildBanner('../assets/images/banner4.png'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _quickAccessButton(Icons.shopping_bag, 'محصولات', () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoriesPage()));
                  }),
                  _quickAccessButton(Icons.person, 'پروفایل', () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                  }),
                  _quickAccessButton(Icons.support_agent, 'پشتیبانی', () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactusPage()));
                  }),
                  _quickAccessButton(Icons.login, 'ورود', () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  }),
                ],
              ),

              const SizedBox(height: 32),

              const Text(
                '🔥 محصولات ویژه',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('گوشی A52', '../assets/images/a52.jpg', 12500000),
                    _buildProductCard('PS5', '../assets/images/Ps5.jpg', 25000000),
                    _buildProductCard('لپ‌تاپ lenovo', '../assets/images/lenovo.png', 38500000),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                '🏆 پرفروش‌ترین‌ها',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('کارت حافظه 64GB', '../assets/images/memory.jpg', 350000),
                    _buildProductCard('مودم TD-LTE', '../assets/images/tdelte.jpg', 720000),
                    _buildProductCard('مانیتور 24 اینچ', '../assets/images/monitor.jpg', 5800000),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
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
                value: 'categories',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('دسته بندی', textDirection: TextDirection.rtl),
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
                value: 'login',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('ورود', textDirection: TextDirection.rtl),
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
            ],
          );

          if (selected == 'cart') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
          } else if (selected == 'profile') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
          } else if (selected == 'contactus') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactusPage()));
          } else if (selected == 'aboutus') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutusPage()));
          } else if (selected == 'login') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else if (selected == 'categories') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoriesPage()));
          }

        },
        tooltip: 'منو',
        child: const Icon(Icons.menu),
      ),
    );
  }
  Widget _buildBanner(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildProductCard(String title, String imagePath, int price) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 2),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
              child: Text(
                '$price تومان',
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAccessButton(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: const Color.fromARGB(255, 244, 3, 99),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
