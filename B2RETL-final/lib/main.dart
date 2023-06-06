import 'package:b2retl/pages/MyOrder.dart';
import 'package:b2retl/pages/ShopList.dart';
import 'package:b2retl/pages/aboutUs.dart';
import 'package:b2retl/pages/addShop.dart';
import 'package:b2retl/pages/dashboard.dart';
import 'package:b2retl/pages/forget.dart';
import 'package:b2retl/pages/helpAndSupport.dart';
import 'package:b2retl/pages/login.dart';
import 'package:b2retl/pages/product_list.dart';
import 'package:b2retl/pages/profile.dart';
import 'package:b2retl/pages/resetpassword.dart';
import 'package:b2retl/pages/signup.dart';
import 'package:b2retl/pages/verifyOtp.dart';
import 'package:b2retl/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:b2retl/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/login': (context) => const Login(),
        '/forget': (context) => const ForgetPassword(),
        '/verify': (context) => const VerifyOTP(),
        '/reset': (context) => const Reset(),
        '/dashboard': (context) => const Dashboard(),
        '/profile': (context) => const Profile(),
        '/products': (context) => const ProductList(),
        '/addShop': (context) => const AddShop(),
        '/shopList': (context) => const ShopList(),
        '/helpAndSupport': (context) => const HelpAndSupport(),
        '/about': (context) => const RetailerAboutUsPage(),
        '/order': (context) => const MyOrder(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
