import 'package:app/screen/add_photos_screen.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String selectedGender = "Non-binary";
  String selectedPronoun = "she / her";

  @override
  Widget build(BuildContext context) {
    const Color pinkAccent = Color(0xFFF76B8D);
    const Color darkBg = Color(0xFF0E061B);
    const Color fieldBg = Color(0xFF2A1F47);

    return Scaffold(
      backgroundColor: darkBg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              /// Fixed Top Bar and Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                          "Step 1 of 4",
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 4,
                            decoration: BoxDecoration(
                              color: index == 0 ? pinkAccent : Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        /// Title
                        const Text(
                          "Tell us about",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "yourself",
                          style: TextStyle(
                            fontSize: 32,
                            color: pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Full Name
                        _buildLabel("FULL NAME"),
                        const SizedBox(height: 8),
                        _buildTextField(fieldBg, hint: "Enter your full name"),

                        const SizedBox(height: 24),

                        /// Age + City
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel("AGE"),
                                  const SizedBox(height: 8),
                                  _buildTextField(fieldBg, hint: "Enter your age"),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel("CITY"),
                                  const SizedBox(height: 8),
                                  _buildTextField(fieldBg, hint: "Enter your city"),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        /// Height
                        _buildLabel("HEIGHT"),
                        const SizedBox(height: 8),
                        _buildTextField(fieldBg, hint: "5'6\""),

                        const SizedBox(height: 32),

                        /// Gender
                        _buildLabel("I AM A..."),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildChoiceChip("Woman", selectedGender == "Woman", (val) => setState(() => selectedGender = "Woman"), pinkAccent, fieldBg),
                            _buildChoiceChip("Man", selectedGender == "Man", (val) => setState(() => selectedGender = "Man"), pinkAccent, fieldBg),
                            _buildChoiceChip("Non-binary", selectedGender == "Non-binary", (val) => setState(() => selectedGender = "Non-binary"), pinkAccent, fieldBg),
                            _buildChoiceChip("Other", selectedGender == "Other", (val) => setState(() => selectedGender = "Other"), pinkAccent, fieldBg),
                          ],
                        ),

                        const SizedBox(height: 32),

                        /// Pronouns
                        _buildLabel("PRONOUNS"),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildChoiceChip("she / her", selectedPronoun == "she / her", (val) => setState(() => selectedPronoun = "she / her"), pinkAccent, fieldBg),
                            _buildChoiceChip("he / him", selectedPronoun == "he / him", (val) => setState(() => selectedPronoun = "he / him"), pinkAccent, fieldBg),
                            _buildChoiceChip("they / them", selectedPronoun == "they / them", (val) => setState(() => selectedPronoun = "they / them"), pinkAccent, fieldBg),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              /// Fixed Continue Button
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
                        MaterialPageRoute(builder: (context) => const AddPhotosScreen()),
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white38,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildTextField(Color bgColor, {String? hint}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: bgColor.withOpacity(0.6),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected, Function(bool) onSelected, Color activeColor, Color inactiveColor) {
    return GestureDetector(
      onTap: () => onSelected(true),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : inactiveColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
