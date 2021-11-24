import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igricultor_app/auth/pages/auth_page.dart';
import 'package:igricultor_app/private/pages/chat_detail_page.dart';
import 'package:igricultor_app/private/pages/chat_list_page.dart';
import 'package:igricultor_app/private/pages/check_out_page.dart';
import 'package:igricultor_app/private/pages/checkout_success_page.dart';
import 'package:igricultor_app/private/pages/home_page.dart';
import 'package:igricultor_app/private/pages/order_detail_page.dart';
import 'package:igricultor_app/private/pages/order_list_page.dart';
import 'package:igricultor_app/private/pages/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iGricultor App',
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
        '/product-detail': (context) => const ProductDetailPage(),
        '/chat-detail': (context) => const ChatDetailPage(),
        '/checkout': (context) => const CheckOutPage(),
        '/checkout-success': (context) => const CheckoutSuccessPage(),
        '/order-list': (context) => const OrderListPage(),
        '/order-detail': (context) => const OrderDetailPage(),
        '/chat': (context) => const ChatListPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
