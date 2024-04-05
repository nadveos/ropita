import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lena/presentations/widgets/slider_products.dart';
import 'package:lena/presentations/widgets/widgets.dart';

class AllProductos extends ConsumerStatefulWidget {
  const AllProductos({super.key});

  @override
  ConsumerState<AllProductos> createState() => _AllProductosState();
}

class _AllProductosState extends ConsumerState<AllProductos> {
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
        child: SafeArea(
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black54),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/gallery');
                },
                child: Text(
                  'Ver Todo',
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                )),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Text(
                'Elegí tu ropita'.toUpperCase(),
                style: GoogleFonts.montserrat(color: Colors.white, fontSize:30),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SliderShow(),
                  const Gap(10),
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
          ),
        ));
  }
}
