import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/presentations/widgets/bottom_things.dart';
import 'package:ropijamas/presentations/widgets/clothes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'assets/images/lena.png',
                            width: 150,
                            height: 200,
                          ),
                        ),
                        Text(
                          'LENA',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ropita comoda...',
                          style: GoogleFonts.montserrat(
                              fontSize: 30, color: Colors.white70),
                        ),
                      ],
                    ),
                    const BottomThings()
                  ],
                ),
                const Gap(20),
                const Flexible(child: Clothes())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
