// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

            return GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    const QuiltedGridTile(2, 2),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 2),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: ropa.length,
                  (context, index) {
                    return Hero(
                      transitionOnUserGestures: true,
                      tag: ropa[index].id,
                      child: Card(
                        elevation: 0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Ink.image(
                              image: NetworkImage(
                                          '${ropa[index].getImageUrl()}'),
                              height: double.infinity,
                              colorFilter:  const ColorFilter.mode(
                                  Colors.black, BlendMode.dstATop),
                              fit: BoxFit.cover,
                              child: InkWell(
                                
                                
                                onTap: () {
                                  //? Push deatil page
                                  Navigator.pushNamed(context, '/details',
                            arguments: ropa[index]);
                                },
                              ),
                            ),
                            Text(
                              ropa[index].name.toUpperCase(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ));
          }
          return const Center(
            child: LinearProgressIndicator(),
          );
        });
  }
}
