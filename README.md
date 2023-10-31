# ropijamas

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Este es codigo de la pagina
```
    import 'package:flutter/material.dart';
import 'package:ropijamas/presentations/widgets/adult_clothes.dart';

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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(205, 122, 224, 1),
            Color.fromRGBO(99, 82, 108, 1)
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: AdultClothes(),
      ),
    );
  }
}

```
este es codigo del widget
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/providers/data_provider.dart';

class AdultClothes extends StatefulWidget {
  const AdultClothes({super.key});

  @override
  State<AdultClothes> createState() => _AdultClothesState();
}

class _AdultClothesState extends State<AdultClothes> {
  DataProvider clothes = DataProvider();
  List<SimpleProduct> ropa = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clothes.getAdultClothes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ropa = snapshot.data!.items;

          return ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: ropa.length,
            itemBuilder: (context, index) {
              return  Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                              color: const Color.fromARGB(255, 251, 251, 251),
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
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/details',
                                    arguments: ropa[index]);
                              },
                              icon: const Icon(
                                CupertinoIcons.arrow_right_square,
                                color: Colors.white,
                                size: 40,
              
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              );
            },
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

```
Mi problema radica en necesitar insertar una columna con un texto en la screen Home pero suele salirme un erro 'hasSize', como lo soluciono