import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ScrollController controller = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
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
            body: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: LayoutChico())));
  }
}

class LayoutChico extends StatelessWidget {
  const LayoutChico({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/images/lena.png',
                    width: double.infinity,
                    height: 400,
                  ),
                ),
                Text(
                  'LENA',
                 
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
                AnimatedTextKit(
                  
                  animatedTexts: [
                
                TypewriterAnimatedText(
                  'Ropita cómoda...',
                  
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 30, color: Colors.white70),
                ),



                ]),
                const Gap(15),
                SlideInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: IconButton.outlined(
                    padding: const EdgeInsets.all(15),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/products');
                      },
                      icon: const Icon(FontAwesomeIcons.arrowRight, size: 40,)),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
