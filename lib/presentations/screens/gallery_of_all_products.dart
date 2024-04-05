import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lena/infrastructure/models/simple_product_model.dart';
import 'package:lena/presentations/services/services.dart';

class GalleryOfAllProducts extends StatefulWidget {
  const GalleryOfAllProducts({super.key});

  @override
  State<GalleryOfAllProducts> createState() => _GalleryOfAllProductsState();
}

class _GalleryOfAllProductsState extends State<GalleryOfAllProducts> {
  Services data = Services();
  List<SimpleProduct> ropa = [];

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
        appBar: AppBar(
          
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            title: Text(
              'Galeria de Ropita'.toUpperCase(),
              style: GoogleFonts.montserrat(color: Colors.white70),
            )),
        body: FutureBuilder(
            future: data.getAllClothes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ropa = snapshot.data!.items;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return MasonryGridView.builder(

                        itemCount: ropa.length,
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    constraints.maxWidth < 350 ? 1 : 2),
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: ropa[index].id,
                            child: SizedBox(
                              width: 240,
                              height: 200,
                              child: Card(
                                
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  fit: StackFit.loose,
                                  alignment: Alignment.center,
                                  children: [
                                    Ink.image(
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        ropa[index].getImageUrl(),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/details',
                                              arguments: ropa[index]);
                                        },
                                      ),
                                    ),
                                    Text(
                                      ropa[index].name,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white70,
                                          shadows: [
                                            const Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.black,
                                              offset: Offset(3.0, 3.0),
                                            ),
                                          ],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Chip(
                                        elevation: 0,
                                        backgroundColor: Colors.purple[200],
                                        labelPadding: const EdgeInsets.all(2),
                                        label: Text(
                                          ropa[index].category.toUpperCase(),
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black87),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return MasonryGridView.builder(
                      itemCount: ropa.length,
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  constraints.maxWidth > 1280 ? 4 : 3),
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: ropa[index].id,
                          child: SizedBox(
                            width: 240,
                            height: 200,
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                fit: StackFit.loose,
                                alignment: Alignment.center,
                                children: [
                                  Ink.image(
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      ropa[index].getImageUrl(),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/details',
                                            arguments: ropa[index]);
                                      },
                                    ),
                                  ),
                                  Text(
                                    ropa[index].name,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white70,
                                        shadows: [
                                          const Shadow(
                                            blurRadius: 10.0,
                                            color: Colors.black,
                                            offset: Offset(3.0, 3.0),
                                          ),
                                        ],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Chip(
                                      backgroundColor: Colors.purple[200],
                                      labelPadding: const EdgeInsets.all(2),
                                      label: Text(
                                        ropa[index].category.toUpperCase(),
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black87),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              return const SpinKitCircle(color: Colors.purple, size: 50.0);
            }),
      ),
    );
  }
}
