import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key, required this.onTap, required this.anstext});

  final String anstext;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        foregroundColor: Colors.pinkAccent,
        backgroundColor: Colors.black,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        )
      ),
      child: Text(
        anstext,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          //fontSize: 15
        ) ,
      )
    );
  }
}
