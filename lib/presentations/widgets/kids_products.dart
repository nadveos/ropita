import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lena/infrastructure/models/simple_product_model.dart';
import 'package:lena/presentations/services/services.dart';

class KidsProducts extends StatefulWidget {
  const KidsProducts({super.key});

  @override
  State<KidsProducts> createState() => _KidsProductsState();
}

class _KidsProductsState extends State<KidsProducts> {
  ScrollController controller = ScrollController();

  List<SimpleProduct> ropa = [];
  Services servicio = Services();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: servicio.kidsClothes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ropa = snapshot.data!.items;
          return Scrollbar(
            controller: controller,
            trackVisibility: true,
            thumbVisibility: true,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical:10),
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: ropa.length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: ropa[index].id,
                  child: SizedBox(
                    width: 210,
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
                        alignment: Alignment.bottomCenter,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ropa[index].name,
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
                );
              },
            ),
          );
        }
        return const Center(
            child: SpinKitRotatingCircle(
          color: Color.fromARGB(255, 172, 225, 131),
          size: 150.0,
        ));
      },
    );
  }
}
