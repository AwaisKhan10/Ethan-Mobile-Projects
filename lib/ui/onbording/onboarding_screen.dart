import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/auth/sign_up/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController carouselController = CarouselController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/dynamic_assets/onboarding.png",
      "title": "Algorithm",
      "subtitle":
          "Users go through a vetting process to ensure your match is legit.",
    },
    {
      "image": "assets/dynamic_assets/dressing.png",
      "title": "Matches",
      "subtitle":
          "We match you with people that have a large array of similar interests.",
    },
    {
      "image": "assets/dynamic_assets/stylish.png",
      "title": "Premium",
      "subtitle":
          "Sign up today and enjoy the first month of premium benefits on us.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),

            /// ✅ Carousel Section
            CarouselSlider.builder(
              itemCount: onboardingData.length,
              options: CarouselOptions(
                height: 420,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final item = onboardingData[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// ✅ Image
                    Container(
                      height: 260,
                      width: 235,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(item["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// ✅ Title
                    Text(
                      item["title"]!,
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// ✅ Subtitle
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          item["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orbitron(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 40),

            /// ✅ Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: onboardingData.asMap().entries.map((entry) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 12,
                  ),
                  width: _currentIndex == entry.key ? 12 : 8,
                  height: _currentIndex == entry.key ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.red
                        : Colors.grey.shade400,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            /// ✅ Create Account Button
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7FEFE9),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUPScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Create Your Account",
                    style: GoogleFonts.orbitron(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            /// ✅ Sign In Button
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUPScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 250),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.orbitron(color: whiteColor, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final CarouselController carouselController = CarouselController();
//   int _currentIndex = 0;

//   final List<String> images = [
//     'assets/dynamic_assets/onboarding.png',
//     'assets/dynamic_assets/dressing.png',
//     'assets/dynamic_assets/stylish.png',
//   'assets/dynamic_assets/onboarding.png',
//     'assets/dynamic_assets/dressing.png',
//     'assets/dynamic_assets/stylish.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 40),
//         CarouselSlider.builder(
//           itemCount: images.length,
//           //  carouselController: carouselController, // ✅ this will work now
//           options: CarouselOptions(
//             height: 400,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 3),
//             autoPlayAnimationDuration: const Duration(milliseconds: 800),
//             enlargeCenterPage: true,
//             viewportFraction: 0.6, // 3 images on screen
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//           ),
//           itemBuilder: (context, index, realIndex) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: AssetImage(images[index]),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: images.asMap().entries.map((entry) {
//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               width: _currentIndex == entry.key ? 12 : 8,
//               height: _currentIndex == entry.key ? 12 : 8,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _currentIndex == entry.key
//                     ? Colors.red
//                     : Colors.grey.shade400,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter_application_ethan/core/custom_widgets/custom_button.dart';
// import 'package:flutter_application_ethan/ui/onbording/onboarding_view_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart'; 

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final OnboardingViewModel viewModel = OnboardingViewModel();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           const SizedBox(height: 60),
//           CarouselSlider.builder(
//             itemCount: viewModel.pages.length,
//             itemBuilder: (context, index, realIndex) {
//               final item = viewModel.pages[index];
//               return Column(
//                 children: [
//                   Container(
//                     width: 235,
//                     height: 360,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: AssetImage(item.image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Text(
//                     item.title,
//                     style: GoogleFonts.orbitron(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Text(
//                       item.subtitle,
//                       textAlign: TextAlign.center,
//                       style:  GoogleFonts.orbitron(color: Colors.white70, fontSize: 14),
//                     ),
//                   ),
//                 ],
//               );
//             },
//             options: CarouselOptions(
//   height: 500,
// viewportFraction: 0.6,
// enlargeCenterPage: true,
//   autoPlay: false, // <-- Yeh line add karni hai
//   autoPlayInterval: Duration(seconds: 3), // <-- Slide har 3 second mein change hogi
//   onPageChanged: (index, reason) {
//     setState(() => currentIndex = index);
//   },
// ),),
//           //   options: CarouselOptions(
//           //     height: 500,
//           //     viewportFraction: 1.0,
//           //     autoPlay: true,
//           //     enlargeCenterPage: false,
//           //     onPageChanged: (index, reason) {
//           //       setState(() => currentIndex = index);
//           //     },
//           //   ),
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               viewModel.pages.length,
//               (index) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//                 width: 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: currentIndex == index ? Colors.red : Colors.grey,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: CustomButton(
//               text: 'Create Your Account',
//               onTap: () {},
//             ),
//           ),
//           const SizedBox(height: 12),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Sign In',
//               style: GoogleFonts.orbitron(color: Colors.white70),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
 
// import 'package:flutter/material.dart';
// import 'package:flutter_application_ethan/core/custom_widgets/custom_button.dart';
// import 'package:flutter_application_ethan/ui/onbording/onboarding_view_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final OnboardingViewModel viewModel = OnboardingViewModel();
//   final CarouselController carouselController = CarouselController();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),

//             /// ✅ Carousel Section
//             CarouselSlider.builder(
//               // carouselController: carouselController,
//               itemCount: viewModel.pages.length,
//               options: CarouselOptions(
//                 height: height * 0.6, // Responsive height
//                 viewportFraction: 0.8,
//                 enlargeCenterPage: true,
//                 autoPlay: true,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 onPageChanged: (index, reason) {
//                   setState(() => currentIndex = index);
//                 },
//               ),
//               itemBuilder: (context, index, realIndex) {
//                 final item = viewModel.pages[index];
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// ✅ Image
//                     Container(
//                       height: 300,
//                       width: 220,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                           image: AssetImage(item.image),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// ✅ Title
//                     Text(
//                       item.title,
//                       style: GoogleFonts.orbitron(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     /// ✅ Subtitle
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Text(
//                         item.subtitle,
//                         textAlign: TextAlign.center,
//                          style:  GoogleFonts.orbitron(color: Colors.white70, fontSize: 14),
                        
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),

//             /// ✅ Dot Indicators
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 viewModel.pages.length,
//                 (index) => AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//                   width: currentIndex == index ? 12 : 8,
//                   height: currentIndex == index ? 12 : 8,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: currentIndex == index
//                         ? Colors.cyanAccent
//                         : Colors.grey.shade600,
//                   ),
//                 ),
//               ),
//             ),

//             /// ✅ Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: CustomButton(
//                 text: 'Create Your Account',
//                 onTap: () {},
//               ),
//             ),

//             const SizedBox(height: 12),

//             /// ✅ Sign In
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 'Sign In',
//                    style: GoogleFonts.orbitron(color: Colors.white70),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_application_ethan/core/custom_widgets/custom_button.dart';
// import 'package:flutter_application_ethan/ui/onbording/onboarding_view_model.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart'; 

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final OnboardingViewModel viewModel = OnboardingViewModel();
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           const SizedBox(height: 60),
//           CarouselSlider.builder(
//             itemCount: viewModel.pages.length,
//             itemBuilder: (context, index, realIndex) {
//               final item = viewModel.pages[index];
//               return Column(
//                 children: [
//                   Container(
//                     width: 235,
//                     height: 360,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: AssetImage(item.image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Text(
//                     item.title,
//                     style: GoogleFonts.orbitron(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Text(
//                       item.subtitle,
//                       textAlign: TextAlign.center,
//                       style:  GoogleFonts.orbitron(color: Colors.white70, fontSize: 14),
//                     ),
//                   ),
//                 ],
//               );
//             },  options: CarouselOptions(
//               height: 500,
//               viewportFraction: 1.0,
//               autoPlay: true,
//               enlargeCenterPage: false,
//               onPageChanged: (index, reason) {
//                 setState(() => currentIndex = index);
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               viewModel.pages.length,
//               (index) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
//                 width: 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: currentIndex == index ? Colors.red : Colors.grey,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: CustomButton(
//               text: 'Create Your Account',
//               onTap: () {},
//             ),
//           ),
//           const SizedBox(height: 12),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Sign In',
//               style: GoogleFonts.orbitron(color: Colors.white70),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
