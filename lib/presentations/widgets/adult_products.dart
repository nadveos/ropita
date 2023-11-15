import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/services/services.dart';

class AdultProducts extends StatefulWidget {
  const AdultProducts({super.key});

  @override
  State<AdultProducts> createState() => _AdultProductsState();
}

class _AdultProductsState extends State<AdultProducts> {
  ScrollController controller = ScrollController();

  List<SimpleProduct> ropa = [];

  Services servicio =  Services();
  @override
  Widget build(BuildContext context) {
    // final data = context.watch<DataProvider>();
    return FutureBuilder(
      future: servicio.adultClothes(),
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
                  height: 200,
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
                          height:double.infinity,
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
          color: Color.fromARGB(255, 183, 22, 177),
          size: 150.0,
        ));
      },
    );
  }
}
