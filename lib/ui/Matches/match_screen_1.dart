import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/card/card_screen.dart';
import 'package:flutter_application_ethan/ui/profile/profile_screen.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchScreen1 extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {"name": "Aisha", "age": "24", "image": "assets/dynamic_assets/ambani.png"},
    {
      "name": "Sara",
      "age": "22",
      "image": "assets/dynamic_assets/Annabelle.png",
    },
    {"name": "Hina", "age": "26", "image": "assets/dynamic_assets/Reagan.png"},
    {"name": "Maya", "age": "25", "image": "assets/dynamic_assets/Hadley.png"},
    {
      "name": "Hidden",
      "age": "26",
      "image": "assets/dynamic_assets/hidden.png",
    },
    {
      "name": "Talent",
      "age": "25",
      "image": "assets/dynamic_assets/talent.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 6),
                      Text(
                        "User Online: 345",
                        style: GoogleFonts.orbitron(
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  // Icon(Icons.notifications_none, size: 26, color: Colors.black),
                ],
              ),

              SizedBox(height: 12),

              // Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Matches",
                    style: GoogleFonts.orbitron(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.tune, color: Colors.white),
                    onPressed: () {
                      showFilterBottomSheet(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: 4),
              Text(
                "This is a list of people who have\nliked you and your matches.",
                style: GoogleFonts.orbitron(fontSize: 16, color: whiteColor),
              ),

              SizedBox(height: 12),
              Row(children: [Container(height: 2, color: Colors.grey[300])]),
              SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ///
                        /// Profile Details
                        ///
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.asset(
                              matches[index]["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${matches[index]["name"]}, ${matches[index]["age"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      String selectedInterest = "Girls";
      double distance = 50;
      List<double> ageRange = [18, 30];

      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Empty space + Clear
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedInterest = "Girls";
                          distance = 50;
                          ageRange = [18, 30];
                        });
                      },
                      child: Text(
                        "Clear",
                        style: GoogleFonts.orbitron(
                          color: const Color(0xFF8A2BE2),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Interested in
                Text(
                  "Interested in",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),

                // Interest selector
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      buildInterestButton("Girls", selectedInterest, () {
                        setState(() => selectedInterest = "Girls");
                      }),
                      buildInterestButton("Boys", selectedInterest, () {
                        setState(() => selectedInterest = "Boys");
                      }),
                      buildInterestButton("Both", selectedInterest, () {
                        setState(() => selectedInterest = "Both");
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Location selector
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chicago, USA",
                        style: GoogleFonts.orbitron(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Distance
                Text(
                  "Distance",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Slider(
                  value: distance,
                  onChanged: (val) => setState(() => distance = val),
                  min: 0,
                  max: 100,
                  activeColor: const Color(0xFF8A2BE2),
                  inactiveColor: Colors.white54,
                ),
                const SizedBox(height: 20),

                // Age
                Text(
                  "Age",
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                FlutterSlider(
                  values: ageRange,
                  rangeSlider: true,
                  max: 60,
                  min: 18,
                  handler: customSliderHandler(),
                  rightHandler: customSliderHandler(),
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBar: BoxDecoration(
                      color: const Color(0xFF8A2BE2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    inactiveTrackBar: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    setState(() {
                      ageRange[0] = lowerValue;
                      ageRange[1] = upperValue;
                    });
                  },
                ),
                const SizedBox(height: 30),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8A2BE2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // showDrinkSelectionBottomSheet(context);
                    },
                    child: Text(
                      "Continue",
                      style: GoogleFonts.orbitron(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    },
  );
}
