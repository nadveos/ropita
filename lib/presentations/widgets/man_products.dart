import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/services/services.dart';

class ManProducts extends StatefulWidget {
  const ManProducts({super.key});

  @override
  State<ManProducts> createState() => _ManProductsState();
}

class _ManProductsState extends State<ManProducts> {
  ScrollController controller = ScrollController();

  List<SimpleProduct> ropa = [];
  Services servicio = Services();
  @override
  Widget build(BuildContext context) {
   
    return FutureBuilder(
      future: servicio.menClothes(),
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
                              color: Colors.black,
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
