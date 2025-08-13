import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// --------------------- Back Button ---------------------
Widget backButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
    ),
  );
}

/// --------------------- Skip Button ---------------------
Widget skipButton(BuildContext context, Widget? nextScreen) {
  return GestureDetector(
    onTap: () {
      if (nextScreen != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
      }
    },
    child: Text(
      "Skip",
      style: GoogleFonts.orbitron(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/// --------------------- Continue Button ---------------------
Widget continueButton(BuildContext context, Widget nextScreen) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2EE6D6),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
    },
    child: Text(
      "Continue",
      style: GoogleFonts.orbitron(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
