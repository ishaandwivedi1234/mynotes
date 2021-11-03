import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Color blue = Color(0xFF002366);
Color darkBg = Color(0xFF082032);
Color darkFg = Color(0xFF141E61);
Color darkFg2 = Color(0xFF2C394B);
Color cursorColor = Color(0xFF2C394B);
Color shade2 = Color(0xFFBEDBBB);
Color shade1 = Color(0xFFE8E9A1);

Color shade3 = Color(0xFFFCD1D1);


double h(context) {
  return MediaQuery.of(context).size.height;
}

double w(context) {
  return MediaQuery.of(context).size.width;
}

Text txt(String txt,
    {font = 'Open Sans', size = 14.0, isBold = false, c = Colors.black}) {
  return Text(
    txt,
    style: GoogleFonts.getFont(font, color: c, fontSize: size),
  );
}

Text dynamicTxt(String txt, {font = 'Open Sans', size = 14.0, isBold = false}) {
  final box = GetStorage();
  return Text(
    txt,
    style: GoogleFonts.getFont(font,
        color: box.read('isDark') == true ? Colors.white : Colors.black,
        fontSize: size),
  );
}
