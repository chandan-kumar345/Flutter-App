import 'package:app/screen/bio_interests_screen.dart';
import 'package:flutter/material.dart';

class AddPhotosScreen extends StatefulWidget {
  const AddPhotosScreen({super.key});

  @override
  State<AddPhotosScreen> createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  @override
  Widget build(BuildContext context) {
    const Color pinkAccent = Color(0xFFF76B8D);
    const Color darkBg = Color(0xFF1B0E2F);
    const Color cardBg = Color(0xFF2A1F47);

    return Scaffold(
      backgroundColor: darkBg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B0E2F),
              Color(0xFF0E061B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// Header and Progress Bar (Fixed at top)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          ),
                        ),
                        const Text(
                          "Step 2 of 4",
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      // child: Text(
                      //   "PROFILE SETUP",
                      //   style: TextStyle(
                      //     color: pinkAccent,
                      //     letterSpacing: 2,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildProgress(true, pinkAccent)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildProgress(true, pinkAccent)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildProgress(false, Colors.white10)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildProgress(false, Colors.white10)),
                      ],
                    ),
                  ],
                ),
              ),

              /// Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        /// Title
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 36,
                              height: 1.1,
                              fontFamily: 'Georgia',
                            ),
                            children: [
                              TextSpan(
                                text: "Add your\n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "best photos",
                                style: TextStyle(
                                  color: pinkAccent,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Profiles with great photos get 3× more matches.",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 32),

                        /// Photo Grid
                        Row(
                          children: [
                            Expanded(
                              child: _buildPhotoCard(
                                height: 220,
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFDB59E), Color(0xFFF76B8D)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                hasCheck: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildPhotoCard(
                                height: 220,
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFAEC6F5), Color(0xFF7699D4)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                hasCheck: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildPhotoCard(
                                height: 140,
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFA7E8C4), Color(0xFF6BCB9F)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                hasCheck: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildDashedAddCard(height: 140, bgColor: cardBg),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildDashedAddCard(height: 140, bgColor: cardBg),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        /// Tip Box
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: const Row(
                            children: [
                              Text("💡", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  "Use a clear face photo as your main pic. Natural light works best!",
                                  style: TextStyle(
                                    color: pinkAccent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),

              /// Continue Button (Fixed at bottom)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: pinkAccent.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BioInterestsScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgress(bool filled, Color color) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildPhotoCard({
    required double height,
    required Gradient gradient,
    bool hasCheck = false,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 60,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          if (hasCheck)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDashedAddCard({required double height, required Color bgColor}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white10,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Color(0xFFF76B8D)),
          SizedBox(height: 8),
          Text(
            "Add photo",
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
