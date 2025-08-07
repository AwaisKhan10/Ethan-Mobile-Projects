import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/Number/number_screen.dart';
import 'package:flutter_application_ethan/ui/auth/sign_up/Bar_closed_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUPScreen extends StatelessWidget {
  
  const SignUPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 120),

            /// 🍸 Icon
            Center(
              child: Image.asset(
        "assets/dynamic_assets/LogoTransparent.png",
                height: 127,
                width: 127,
              ),
            ),

            const SizedBox(height: 24),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 59,        
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7FEFE9),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                                   Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                   builder: (context) => const BarClosedScreen()
                                   ),
                                    );
                  },
                  child: Text(
                    "Continue with email",
                    style: GoogleFonts.orbitron(fontSize: 14,color: whiteColor),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 59,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF581C87),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                            Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                   builder: (context) => const NumberScreen()
                                   ),
                  );  } ,
                  child: Text(
                    "Use phone number",
                    style: GoogleFonts.orbitron(fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 120),

            /// Social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon("assets/icons_assets/facebook.png"),
                const SizedBox(width: 16),
                _socialIcon("assets/icons_assets/google.png"),
                const SizedBox(width: 16),
                _socialIcon("assets/icons_assets/apple.png"),
              ],
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

  Widget _socialIcon(String path) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Image.asset(
        path,
        width: 24,
        height: 24,
        fit: BoxFit.fill
      ),
    ),
  );
}}