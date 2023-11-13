import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/presentations/widgets/widgets.dart';

class AllProductos extends StatefulWidget {
  const AllProductos({super.key});

  @override
  State<AllProductos> createState() => _AllProductosState();
}

class _AllProductosState extends State<AllProductos> {
  
    

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Elegí tu ropita'.toUpperCase(),
              style: GoogleFonts.montserrat(color: Colors.white70),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // only man´s products
                Column(
                  children: [
                    const Gap(20),
                    Text(
                      'Hombres',
                      style: GoogleFonts.montserrat(
                        color: Colors.white60,
                        fontSize: 40,
                      ),
                    ),
                    const Gap(20),
                    const SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ManProducts()),
                  ],
                ),
                // // // kids categoty
                Column(
                  children: [
                    const Gap(20),
                    Text(
                      'Infantiles',
                      style: GoogleFonts.montserrat(
                        color: Colors.white60,
                        fontSize: 40,
                      ),
                    ),
                    const Gap(20),
                    const SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: KidsProducts()),
                  ],
                ),
                // adult category
                Column(
                  children: [
                    const Gap(20),
                    Text(
                      'Adultos',
                      style: GoogleFonts.montserrat(
                        color: Colors.white60,
                        fontSize: 40,
                      ),
                    ),
                    const Gap(20),
                    const SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: AdultProducts()),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
