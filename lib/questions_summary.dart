import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary,{super.key});

  final List<Map<String,Object>> summary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: data['user_option']==data['correct_option'] ?Colors.lightGreen.shade200: Colors.deepOrange.shade200
                ),
                child: Center(
                  child: Text(
                    ((data['questions_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      data['user_option'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.pink.shade100,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      data['correct_option'] as String,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),
                     const SizedBox(height: 10,)
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
