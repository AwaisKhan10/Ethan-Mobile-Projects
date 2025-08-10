import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/custom_widgets/common_widgets.dart';
import 'package:flutter_application_ethan/ui/notification/notification_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  skipButton(context, NotificationScreen()), 
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 240,
                  width: 240,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor,
                  ),
                  child: 
                  Image.asset("assets/dynamic_assets/people.png")
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Search friend's",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "You can find friends from your contact\nlists\nto connected",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Spacer(),
               continueButton(context, const NotificationScreen()),
            ],
          ),
        ),
      ),
    );
  }
}