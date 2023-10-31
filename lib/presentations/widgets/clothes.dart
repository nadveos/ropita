// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/providers/data_provider.dart';

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  ScrollController controller = ScrollController();

  List<SimpleProduct> ropa = [];

  @override
  Widget build(BuildContext context) {
    final clothes = context.watch<DataProvider>();
    return FutureBuilder(
      future: clothes.getAdultClothes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ropa = snapshot.data!.items;

          return Scrollbar(
            thumbVisibility: true,
            controller: controller,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: ropa.length,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/details',
                            arguments: ropa[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            opacity: 0.6,
                            image: NetworkImage(ropa[index].getImageUrl()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              right: 10,
                              top: 10,
                              child: Text(
                                ropa[index].name,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: GoogleFonts.bebasNeue(
                                  letterSpacing: 5,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 251, 251, 251),
                                  shadows: [
                                    const Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Text(
                                '\$ ${ropa[index].price}',
                                style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: 25,
                                    backgroundColor: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}