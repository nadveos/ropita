import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/providers/data_provider.dart';

class ManProducts extends StatefulWidget {
  const ManProducts({super.key});

  @override
  State<ManProducts> createState() => _ManProductsState();
}

class _ManProductsState extends State<ManProducts> {
  ScrollController controller = ScrollController();

  List<SimpleProduct> ropa = [];
static final _cacheManager = CacheManager(Config('onlyMans',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 50));
  @override
  Widget build(BuildContext context) {
    final data = context.watch<DataProvider>();
    return FutureBuilder(
      future: data.menClothes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ropa = snapshot.data!.items;
          return ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: ropa.length,
            itemBuilder: (context, index) {
              return Hero(
                tag: ropa[index].id,
                child: SizedBox(
                  width: 240,
                  height: 180,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
            child: SpinKitRotatingCircle(
          color: Color.fromARGB(255, 144, 116, 211),
          size: 150.0,
        ));
      },
    );
  }
}
