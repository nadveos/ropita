import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lena/infrastructure/models/simple_product_model.dart';
import 'package:lena/presentations/services/services.dart';

class ManProducts extends ConsumerStatefulWidget {
  const ManProducts({super.key});

  @override
  ConsumerState<ManProducts> createState() => _ManProductsState();
}

class _ManProductsState extends ConsumerState<ManProducts> {
  ScrollController controller = ScrollController();
  List<SimpleProduct> ropa = [];
  Services servicio = Services();

  @override
  Widget build(BuildContext context) {
    // final manPijamas = ref.watch(pijamasRepositoryProvider);
    return FutureBuilder(
      future: servicio.menClothes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ropa = snapshot.data!.items;
          return Scrollbar(
            controller: controller,
            trackVisibility: true,
            thumbVisibility: true,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: ropa.length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: ropa[index].id,
                  child: SizedBox(
                    width: 210,
                    // height: 150,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      clipBehavior: Clip.antiAlias,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details',
                              arguments: ropa[index]);
                        },
                        child: Stack(
                          // fit: StackFit.loose,
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                ropa[index].getImageUrl(),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress != null) {
                                    return const Center(
                                      child: SpinKitRotatingCircle(color: Colors.blue,),
                                    );
                                  }
                                  return child;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ropa[index].name,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    shadows: [
                                      const Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(3.0, 3.0),
                                      ),
                                    ],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
            child: SpinKitRotatingCircle(
          color: Color.fromARGB(255, 25, 72, 224),
          size: 150.0,
        ));
      },
    );
  }
}
