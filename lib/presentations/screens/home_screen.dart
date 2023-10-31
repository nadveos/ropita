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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.purple, Colors.deepPurple],
          stops: [0.2, 0.6, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.inner,
                        blurRadius: 1,
                        color: Colors.white30)
                  ],
                ),
                child: const Clothes(),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
              const BottomThings()
            ],
          ),
        ),
      ),
    );
  }
}

