import 'package:flutter/material.dart';
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
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'ROPIJAMAS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                            letterSpacing: 10,
                            color: Colors.white,
                            fontSize: 60,
                            shadows: [
                              const Shadow(
                                blurRadius: 10.0,
                                color: Colors.black54,
                                offset: Offset(1.0, 3.0),
                              )
                            ]),
                      ),
                      Text(
                        'Tú mejor descanso..',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white60, fontSize: 25),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Clothes(),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 50,),
                    Text(
                      'Terminaciones delicadas',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '100% Algodón',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MOdelos UNISEX',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Comodidad para grandes y chicos',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                const BottomThings()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
