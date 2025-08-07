import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarClosedScreen extends StatelessWidget {
  const BarClosedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),

            /// 🍸 Icon
           Center(
              child: Image.asset(
        "assets/dynamic_assets/LogoTransparent.png",
                height: 127,
                width: 127,
              ),
            ),


            const SizedBox(height: 32),

            /// BAR IS CLOSED
            Text(
              "BAR IS CLOSED!",
              style: GoogleFonts.orbitron(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// Subtext
            Text(
              "Sorry we are closed we will open in!",
              style: GoogleFonts.orbitron(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 24),

            /// Timer
            Text(
              "00:42",
              style: GoogleFonts.orbitron(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const Spacer(),

            /// Terms
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Terms of use  Privacy Policy",
                style: GoogleFonts.orbitron(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
