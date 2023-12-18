import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ropijamas/infrastructure/models/simple_product_model.dart';
import 'package:ropijamas/presentations/services/services.dart';

class SliderShow extends StatefulWidget {
  const SliderShow({super.key});

  @override
  State<SliderShow> createState() => _SliderShowState();
}

class _SliderShowState extends State<SliderShow> {
  ScrollController controller = ScrollController();
  List<SimpleProduct> ropa = [];
  Services servicio = Services();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: servicio.getAllClothes(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            ropa = snapshot.data!.items;
            return SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Swiper(
                    pagination:  SwiperPagination(

                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 0),
                      builder: DotSwiperPaginationBuilder(activeSize: 20,color: Colors.white70,activeColor: Colors.purple[100]),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          ropa[index].getImageUrl(),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: 5,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    autoplay: true,
                  ),
                );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
