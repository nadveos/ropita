import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ropijamas/presentations/screens/all_products.dart';
import 'package:ropijamas/presentations/screens/detail_product_screen.dart';
import 'package:ropijamas/presentations/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Ropijamas',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailProductScreen(),
        '/products': (context) => const AllProductos(),
      },
    );
  }
}
