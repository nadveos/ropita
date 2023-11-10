import 'package:flutter/material.dart';
import 'package:ropijamas/presentations/widgets/clothes.dart';

class AllProductos extends StatelessWidget {
  const AllProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.6, 1.0],
          ),
        ),
        child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: Clothes(),
            )
    );
  }
}