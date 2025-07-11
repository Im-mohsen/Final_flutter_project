import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/products_page.dart';
import 'pages/cart_page.dart';
import 'pages/admin_page.dart';

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
          TextButton.icon(
            onPressed: _showCartBottomSheet,
            icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 0, 0, 0)),
            label: const Text(
              'سبد خرید',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          )
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
            ],
          );

          if (selected == 'products') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsPage()));
          } else if (selected == 'cart') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
          } else if (selected == 'admin') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPage()));
          }
        },
        tooltip: 'منو',
        child: const Icon(Icons.menu),
      ),
    );
  }
}
