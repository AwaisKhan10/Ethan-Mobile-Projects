import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/constants/strings.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_2.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final white = Colors.white;
    final purple = const Color(0xFF9B4DFF);
    Colors.white.withOpacity(0.3);

    final List<String> galleryImages = [
      "$dynamicAssets/photo.png",
      "$dynamicAssets/photo1.png",
      "$dynamicAssets/photo2.png",
      "$dynamicAssets/leilani.png",
      "$dynamicAssets/stylish.png",
      "$dynamicAssets/dressing.png",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          // Profile Image
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  child: Image.asset(
                    "assets/dynamic_assets/photo2.png",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: MediaQuery.of(context).size.width / 2 - 35,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: Icon(Icons.star, color: purple, size: 36),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + Send Icon
                  Row(
                    children: [
                      Text(
                        "Jessica Parker, 23",
                        style: GoogleFonts.orbitron(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.purple,
                            size: 28,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return const DrinkBottomSheet();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Proffesional model",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Location",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Chicago, IL United States",
                          style: GoogleFonts.orbitron(
                            fontSize: 14,
                            color: white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: purple.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: purple, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              "1 km",
                              style: GoogleFonts.orbitron(
                                fontSize: 12,
                                color: purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // About
                  Text(
                    "About",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "My name is Jessica Parker and I enjoy meeting new people...",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      // ignore: deprecated_member_use
                      color: white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Read more",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tags
                  Text(
                    "Female",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag("Travelling", purple, true),
                      _buildTag("Books", purple, true),
                      _buildTag("Music", white, false),
                      _buildTag("Dancing", white, false),
                      _buildTag("Modeling", white, false),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // See all
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "See all",
                        style: GoogleFonts.orbitron(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Gallery
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: List.generate(galleryImages.length, (index) {
                      String imgPath = galleryImages[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FullScreenImage(
                                images: galleryImages,
                                initialIndex: index,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(imgPath, fit: BoxFit.cover),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? color.withOpacity(0.15) : Colors.transparent,
        border: Border.all(color: selected ? color : Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: GoogleFonts.orbitron(
          fontSize: 12,
          color: selected ? color : Colors.white,
        ),
      ),
    );
  }
}

class DrinkBottomSheet extends StatefulWidget {
  const DrinkBottomSheet({super.key});

  @override
  State<DrinkBottomSheet> createState() => _DrinkBottomSheetState();
}

class _DrinkBottomSheetState extends State<DrinkBottomSheet> {
  int selectedIndex = 1; // default selected (5 min)

  final List<Map<String, dynamic>> options = [
    {
      "time": "3 min",
      "price": "3\$",
      "images": "assets/dynamic_assets/icon2.png",
    },
    {
      "time": "5 min",
      "price": "4\$",
      "images": "assets/dynamic_assets/icon1.png",
    },
    {
      "time": "10 min",
      "price": "5\$",
      "images": "assets/dynamic_assets/icon3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 649,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = -1;
                  });
                },
                child: Text(
                  "Clear",
                  style: GoogleFonts.orbitron(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Choose your drink!",
            style: GoogleFonts.orbitron(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(options.length, (index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 110,
                  width: 91,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? AccentColor : Colors.transparent,
                    border: Border.all(
                      width: 2,
                      color: isSelected ? AccentColor : whiteColor,
                    ),
                    // Gradient border simulation
                    gradient: !isSelected
                        ? const LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Colors.blueAccent,
                              Colors.greenAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.pinkAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        blendMode: BlendMode.srcIn,
                        child: Image.asset(
                          options[index]["images"],
                          height: 40,
                          width: 90,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        options[index]["time"],
                        style: GoogleFonts.orbitron(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        options[index]["price"],
                        style: GoogleFonts.orbitron(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 15),
          // Sub Text
          Center(
            child: Text(
              "Send a drink to request a chat",
              style: GoogleFonts.orbitron(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatchScreen2()),
                );
              },
              child: Text(
                "Continue",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// =====================
// Fullscreen Gallery
// =====================
class FullScreenImage extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImage({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == currentIndex;
                    return GestureDetector(
                      onTap: () => _pageController.jumpToPage(index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.purpleAccent
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            widget.images[index],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
