import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropijamas/data/models/products_model.dart';
import 'package:ropijamas/presentations/widgets/bottom_things.dart';
import 'package:ropijamas/presentations/widgets/launcher_of_urls.dart';


class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    final SimpleProduct productDetail =
        ModalRoute.of(context)!.settings.arguments as SimpleProduct;
    final productName = productDetail.name.toUpperCase();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.purple, Colors.deepPurple],
          stops: [0.2, 0.6, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: 380,
              pinned: true,
              flexibleSpace: Hero(
                tag: productDetail.id,
                child: Material(
                  child: InkWell(
                    child: Image.network(
                      productDetail.getImageUrl(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                productDetail.name.toUpperCase(),
                style: GoogleFonts.bebasNeue(
                  fontSize: 40,
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productDetail.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      FontAwesomeIcons.personDress,
                      size: 40,
                      color: Colors.white,
                      semanticLabel: 'Unisex',
                    ),
                    const Icon(
                      FontAwesomeIcons.person,
                      size: 40,
                      color: Colors.white,
                      semanticLabel: 'Unisex',
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Categoria',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Chip(
                          label: Text(
                            productDetail.category.toUpperCase(),
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          backgroundColor: Colors.purple[300],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    productDetail.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Talles ${productDetail.size}',
                    style: GoogleFonts.bebasNeue(
                        color: Colors.white60,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      onLaunch(
                          'https://wa.me/543875705958?text=Quisiera%20consultar%20por%20*_%20$productName%20_*%20.Gracias');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(10)),
                        fixedSize:
                            const MaterialStatePropertyAll(Size.fromWidth(200)),
                        side: const MaterialStatePropertyAll(BorderSide(
                          width: 1,
                          color: Colors.white60,
                        ))),
                    child: Text(
                      'Consultar',
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const BottomThings()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


