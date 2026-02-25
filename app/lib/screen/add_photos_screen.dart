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
    const Color bgColor = Color(0xFFFFF9F2);
    const Color darkText = Color(0xFF1B0E2F);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Step 2 of 4",
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "PROFILE SETUP",
                  style: TextStyle(
                    color: pinkAccent,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              /// Progress Bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: pinkAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: pinkAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              /// Title
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 36,
                    height: 1.1,
                    fontFamily: 'Georgia', // Or a similar serif font if available
                  ),
                  children: [
                    TextSpan(
                      text: "Add your\n",
                      style: TextStyle(
                        color: darkText,
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
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),

              /// Photo Grid
              Expanded(
                child: Column(
                  children: [
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
                          child: _buildDashedAddCard(height: 140),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildDashedAddCard(height: 140),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    /// Tip Box
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF1F1),
                        borderRadius: BorderRadius.circular(12),
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
                  ],
                ),
              ),

              /// Continue Button
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Continue →",
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
          // Silhouette placeholder
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

  Widget _buildDashedAddCard({required double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.black12,
          style: BorderStyle.solid, // Should ideally be dashed, using CustomPainter for true dash
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
              color: Colors.black26,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
