// import 'package:app/screen/signin_screen.dart';
// import 'package:app/screen/signup_screen.dart';
// import 'package:flutter/material.dart';
// import 'signup_screen.dart';
//
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController(viewportFraction: 0.55);
//   int currentIndex = 1;
//
//   final List<Map<String, String>> onboardingData = [
//     {
//       "title": "Find Your Match",
//       "desc": "Discover people who share your vibe and\nstart meaningful conversations.",
//       "image": "assets/images/onboarding1.jpg",
//     },
//     {
//       "title": "Safe & Verified",
//       "desc": "Every profile goes through a verification\nprocess so you meet real people, not bots.",
//       "image": "assets/images/onboarding2.jpg",
//     },
//     {
//       "title": "Premium Experience",
//       "desc": "Unlock premium features to boost your\nvisibility and get better matches faster.",
//       "image": "assets/images/onboarding3.jpg",
//     },
//   ];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     _pageController.addListener(() {
//       final page = _pageController.page ?? 0;
//       setState(() {
//         currentIndex = page.round();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           child: Column(
//             children: [
//               const SizedBox(height: 22),
//
//               /// --- Swipe Cards ---
//               SizedBox(
//                 height: size.height * 0.45,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: onboardingData.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return AnimatedBuilder(
//                       animation: _pageController,
//                       builder: (context, child) {
//                         double value = 1.0;
//
//                         if (_pageController.position.haveDimensions) {
//                           value = (_pageController.page! - index);
//                           value = (1 - (value.abs() * 0.25))
//                               .clamp(0.78, 1.0);
//                         }
//
//                         return Center(
//                           child: Transform.scale(
//                             scale: value,
//                             child: child,
//                           ),
//                         );
//                       },
//                       child: _imageCard(onboardingData[index]["image"]!),
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 22),
//
//               /// --- Dots Indicator ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(onboardingData.length, (index) {
//                   final isActive = index == currentIndex;
//                   return AnimatedContainer(
//                     duration: const Duration(milliseconds: 250),
//                     margin: const EdgeInsets.symmetric(horizontal: 5),
//                     width: isActive ? 18 : 7,
//                     height: 7,
//                     decoration: BoxDecoration(
//                       color: isActive
//                           ? const Color(0xffF0435A)
//                           : Colors.grey.shade300,
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                   );
//                 }),
//               ),
//
//               const SizedBox(height: 26),
//
//               /// --- Title ---
//               Text(
//                 onboardingData[currentIndex]["title"]!,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xffF0435A),
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               /// --- Description ---
//               Text(
//                 onboardingData[currentIndex]["desc"]!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   height: 1.9,
//                   color: Colors.black54,
//                 ),
//               ),
//
//               const Spacer(),
//
//               /// --- Button ---
//               SizedBox(
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xffF0435A),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     elevation: 0,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const DatingSignUpScreen(),
//                       ),
//                     );
//                   },
//
//                   child: const Text(
//                     "Create an account",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 16),
//
//               /// --- Sign In ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Already have an account? ",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.black54,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const SignInScreen()),
//                       );
//                     },
//                     child: const Text(
//                       "Sign In",
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xffF0435A),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//
//
//               const SizedBox(height: 18),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// --- Image Card Widget ---
//   Widget _imageCard(String imageUrl) {
//     return Container(
//       width: 240,
//       margin: const EdgeInsets.symmetric(horizontal: 6),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         image: DecorationImage(
//           image: AssetImage(imageUrl),
//
//           fit: BoxFit.cover,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.10),
//             blurRadius: 22,
//             offset: const Offset(0, 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
