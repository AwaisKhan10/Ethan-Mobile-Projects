import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/custom_widgets/common_widgets.dart';
import 'package:flutter_application_ethan/ui/friends/friends_screen.dart';
import 'package:flutter_application_ethan/ui/root/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PassionsScreen extends StatefulWidget {
  const PassionsScreen({super.key});

  @override
  State<PassionsScreen> createState() => _PassionsScreenState();
}

class _PassionsScreenState extends State<PassionsScreen> {
  final List<Map<String, dynamic>> interests = [
    {"icon": Icons.camera_alt, "label": "Photography", "selected": false},
    {"icon": Icons.shopping_bag, "label": "Shopping", "selected": false},
    {"icon": Icons.mic, "label": "Karaoke", "selected": false},
    {"icon": Icons.self_improvement, "label": "Yoga", "selected": false},
    {"icon": Icons.restaurant, "label": "Cooking", "selected": false},
    {"icon": Icons.sports_tennis, "label": "Tennis", "selected": false},
    {"icon": Icons.directions_run, "label": "Run", "selected": false},
    {"icon": Icons.pool, "label": "Swimming", "selected": false},
    {"icon": Icons.palette, "label": "Art", "selected": false},
    {"icon": Icons.flight_takeoff, "label": "Traveling", "selected": false},
    {"icon": Icons.dangerous, "label": "Extreme", "selected": false},
    {"icon": Icons.music_note, "label": "Music", "selected": false},
    {"icon": Icons.local_bar, "label": "Drink", "selected": false},
    {"icon": Icons.videogame_asset, "label": "Video games", "selected": false},
  ];

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
              // Top Row Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  skipButton(context, RootScreen()),
                ],
              ),
              const SizedBox(height: 40),
              const SizedBox(height: 20),

              // Grid of Interests
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true, // ✅ lets it take only needed height
                  physics:
                      const NeverScrollableScrollPhysics(), // ✅ prevents internal scroll
                  itemCount: interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3.5,
                  ),
                  itemBuilder: (context, index) {
                    final item = interests[index];
                    final bool isSelected = item["selected"];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          interests[index]["selected"] = !isSelected;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF2EE6D6)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"],
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              // ✅ stops text from overflowing
                              child: Text(
                                item["label"],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.orbitron(
                                  fontSize: 14,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
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
              Spacer(),

              // Continue Button
              continueButton(context, const FriendsScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
