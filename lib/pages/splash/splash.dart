import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/pages/utility/util.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.purple,
      child: Scaffold(
        backgroundColor: darkBg,
        body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    
            Center(
              child: Text('My Notes',
              style: GoogleFonts.getFont('Open Sans',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
              ),
              ),
            )
    
        ],),
      ),
    );
  }
}
