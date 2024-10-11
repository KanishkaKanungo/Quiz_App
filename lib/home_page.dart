import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchPage,{super.key});

  final void Function() switchPage;
 
  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Opacity(
                  //   opacity: 0.5,
                  //   child: Image.asset(
                  //       'asset/images/quiz-logo.png',
                  //       width: 300,
                  //       ),
                  // ),
                  Image.asset(
                      'asset/images/quiz-logo.png',
                      width: 300,
                      color: const Color.fromARGB(125, 255, 255, 255),
                      ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Lets learn Flutter the fun way !",
                    style: GoogleFonts.caveat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton.icon(
                    onPressed: switchPage, 
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white
                    ),
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text(
                    "Start Quiz",
                    style: TextStyle(
                    color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}