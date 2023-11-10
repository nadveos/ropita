import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      
        Text(
          'Diseñado y creado por Gustavo J. Flores',
          softWrap: true,
          overflow: TextOverflow.fade,
          style: GoogleFonts.montserratAlternates(
              fontSize: 16, color: Colors.white38),
        ),
        const SizedBox(height: 10,),
        Text(
          'Salta - Argentina ©2023',
          style: GoogleFonts.montserratAlternates(
              fontSize: 10, color: Colors.white38),
        ),
        const Gap(20),
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
        
        
      ],
    );
  }
}
