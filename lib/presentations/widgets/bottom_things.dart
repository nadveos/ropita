import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomThings extends StatelessWidget {
  const BottomThings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(height: 10,),
        Text(
          'Diseñado y creado por Gustavo J. Flores',
          style: GoogleFonts.montserratAlternates(
              fontSize: 16, color: Colors.white24),
        ),
        const SizedBox(height: 10,),
        TextButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.black54)),
          
          onPressed: () {
            
          },
          child: Text(
            'MEAPP.ONLINE',
            style: GoogleFonts.montserratAlternates(
              fontSize: 12,
              color: Colors.white60,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          'Salta - Argentina',
          style: GoogleFonts.montserratAlternates(
              fontSize: 10, color: Colors.white30),
        )
      ],
    );
  }
}
