import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/constants/strings.dart';
import 'package:flutter_application_ethan/ui/iam/i_am_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalProfileScreen extends StatelessWidget {
  const FinalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                Text(
                  'Profile',
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 35),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 101,
                    height: 106,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/dynamic_assets/photo.png"),
                      ),
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // same as width/height / 2
                    ),
                  ),

                  // Bottom-left wrench icon
                  Positioned(
                    bottom: -10,
                    left: -15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const IAmScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset("$iconsAssets/scro.png", scale: 3),
                      ),
                    ),
                  ),

                  // Bottom-right camera icon in purple circle
                  Positioned(
                    bottom: -10,

                    right: -10,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.deepPurple,
                        child: Image.asset("$iconsAssets/camera.png", scale: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            // Fields
            _buildLabeledField('First name', 'David'),
            _buildLabeledField('Last name', 'Peterson'),
            _buildLabeledField('Email', 'asdfksaft@gmail.com'),
            _buildLabeledField('Phone Number', 'xxxxxxxxxxx'),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconButtonWithLabel(
                  icon: Icons.close,
                  label: 'Block List',
                  color: Colors.red,
                ),
                _IconButtonWithLabel(
                  icon: Icons.person,
                  label: 'Request Deletion',
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: 55,
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blackColor,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.40),
                  ),
                ),
                child: Image.asset("$iconsAssets/customerCare.png", scale: 3),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Customer Care",
                style: GoogleFonts.orbitron(fontSize: 10, color: whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabeledField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.orbitron(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Container(
            height: 58,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: GoogleFonts.orbitron(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _IconButtonWithLabel({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 35, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.orbitron(fontSize: 12, color: whiteColor),
        ),
      ],
    );
  }
}
