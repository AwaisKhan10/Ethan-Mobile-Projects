import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_1.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_2.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipable_stack/swipable_stack.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final SwipableStackController _controller = SwipableStackController();

  final List<Map<String, String>> profiles = [
    {
      "name": "Jessica Parker",
      "age": "23",
      "distance": "1 km",
      "job": "Professional model",
      "image":
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
    },
    {
      "name": "Sophia",
      "age": "24",
      "distance": "2 km",
      "job": "UI/UX Designer",
      "image":
          "https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg",
    },
    {
      "name": "Emma",
      "age": "26",
      "distance": "4 km",
      "job": "Photographer",
      "image":
          "https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blackColor,
        automaticallyImplyLeading: false,
        title: Column(
          children: const [
            Text(
              "Discover",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: whiteColor,
              ),
            ),
            Text(
              "Chicago, IL",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 36, 35, 35),
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: whiteColor),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20,
              ),
              child: SwipableStack(
                controller: _controller,
                itemCount: 100000, // large number for infinite feeling
                onSwipeCompleted: (index, direction) {
                  // Swipe complete logic if needed
                },
                builder: (context, properties) {
                  final loopedIndex = properties.index % profiles.length;
                  return buildProfileCard(profiles[loopedIndex]);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildBottomButtons(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildProfileCard(Map<String, String> profile) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(profile["image"]!, fit: BoxFit.cover),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, whiteColor.withOpacity(0.6)],
              ),
            ),
          ),
          // Distance badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    profile["distance"]!,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          // Name & job info
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profile["name"]}, ${profile["age"]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profile["job"]!,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        smallActionButton(Icons.clear, Colors.orange, () {
          _controller.next(swipeDirection: SwipeDirection.left);
        }),
        bigActionButton(Icons.favorite, Colors.pink, () {
          _controller.next(swipeDirection: SwipeDirection.right);
        }),
        smallActionButton(Icons.star, Colors.purple, () {
          _controller.next(swipeDirection: SwipeDirection.up);
        }),
      ],
    );
  }

  Widget smallActionButton(IconData icon, Color color, VoidCallback onTap) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: color, size: 26),
        onPressed: onTap,
      ),
    );
  }

  Widget bigActionButton(IconData icon, Color color, VoidCallback onTap) {
    return CircleAvatar(
      radius: 34,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: color, size: 30),
        onPressed: onTap,
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
                      showDrinkSelectionBottomSheet(context);
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

Widget buildInterestButton(String label, String selected, VoidCallback onTap) {
  bool isSelected = selected == label;

  BorderRadius radius = BorderRadius.zero;
  if (label == "Girls") {
    radius = const BorderRadius.horizontal(left: Radius.circular(20));
  } else if (label == "Both") {
    radius = const BorderRadius.horizontal(right: Radius.circular(20));
  }

  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8A2BE2) : Colors.transparent,
          borderRadius: isSelected ? radius : BorderRadius.zero,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontFamily: "Orbitron"),
        ),
      ),
    ),
  );
}

FlutterSliderHandler customSliderHandler() {
  return FlutterSliderHandler(
    decoration: const BoxDecoration(),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF8A2BE2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.circle, color: Colors.transparent, size: 20),
    ),
  );
}

class DrinkOption {
  final String duration;
  final int price;
  final Color color;

  DrinkOption({
    required this.duration,
    required this.price,
    required this.color,
  });
}

void showDrinkSelectionBottomSheet(BuildContext context) {
  final List<DrinkOption> options = [
    DrinkOption(duration: '3 min', price: 3, color: Color(0xFF661B99)),
    DrinkOption(duration: '5 min', price: 4, color: Color(0xFF6EE6E6)),
    DrinkOption(duration: '10 min', price: 5, color: Color(0xFFF9025B)),
  ];

  int selectedIndex = 1;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      final height = MediaQuery.of(context).size.height;

      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: height * 0.6, // 60% of screen height
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Clear",
                          style: GoogleFonts.orbitron(
                            color: Color(0xFF8A2BE2),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    "Choose your drink!",
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Options
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(options.length, (index) {
                        final item = options[index];
                        final bool isSelected = selectedIndex == index;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(index == 0 ? 25 : 0),
                                  bottomLeft: Radius.circular(
                                    index == 0 ? 25 : 0,
                                  ),
                                  topRight: Radius.circular(
                                    index == options.length - 1 ? 25 : 0,
                                  ),
                                  bottomRight: Radius.circular(
                                    index == options.length - 1 ? 25 : 0,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    item.duration,
                                    style: GoogleFonts.orbitron(
                                      fontSize: 18,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${item.price}\$',
                                    style: GoogleFonts.orbitron(
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const Spacer(),

                  // Continue Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close sheet
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MatchScreen2(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF661B99),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
