import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _selectedLookingFor = "Relationship";
  String _selectedShowMe = "Men";
  RangeValues _ageRange = const RangeValues(24, 36);

  @override
  Widget build(BuildContext context) {
    const Color pinkAccent = Color(0xFFF76B8D);
    const Color darkBg = Color(0xFF1B0E2F);
    const Color cardBg = Color(0xFF2A1F47);

    return Scaffold(
      backgroundColor: darkBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Step 4 of 4",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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
                        children: List.generate(4, (index) {
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 4,
                              decoration: BoxDecoration(
                                color: pinkAccent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 32),
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
                              text: "Your\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "preferences",
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
                        "Help us match you with the right people.",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 32),

                      /// Looking For Section
                      _buildSectionCard(
                        "LOOKING FOR",
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildPreferenceOption("Relationship", "💕", _selectedLookingFor == "Relationship", pinkAccent),
                            _buildPreferenceOption("Casual", "😊", _selectedLookingFor == "Casual", pinkAccent),
                            _buildPreferenceOption("Friends", "🤝", _selectedLookingFor == "Friends", pinkAccent),
                          ],
                        ),
                        cardBg,
                      ),

                      const SizedBox(height: 24),

                      /// Show Me Section
                      _buildSectionCard(
                        "SHOW ME",
                        Wrap(
                          spacing: 12,
                          children: [
                            _buildShowMeChip("Women", _selectedShowMe == "Women", pinkAccent),
                            _buildShowMeChip("Men", _selectedShowMe == "Men", pinkAccent),
                            _buildShowMeChip("Everyone", _selectedShowMe == "Everyone", pinkAccent),
                          ],
                        ),
                        cardBg,
                      ),

                      const SizedBox(height: 24),

                      /// Age Range Section
                      _buildSectionCard(
                        "AGE RANGE",
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  "${_ageRange.start.round()}",
                                  style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),
                                ),
                                const Text(" yr", style: TextStyle(color: Colors.white38, fontSize: 16)),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text("—", style: TextStyle(color: Colors.white38, fontSize: 24)),
                                ),
                                Text(
                                  "${_ageRange.end.round()}",
                                  style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),
                                ),
                                const Text(" yr", style: TextStyle(color: Colors.white38, fontSize: 16)),
                              ],
                            ),
                            RangeSlider(
                              values: _ageRange,
                              min: 18,
                              max: 80,
                              activeColor: pinkAccent,
                              inactiveColor: Colors.white12,
                              onChanged: (values) {
                                setState(() {
                                  _ageRange = values;
                                });
                              },
                            ),
                          ],
                        ),
                        cardBg,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            /// Let's Go Button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
                    // Final Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Let's Go! 🌸",
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
    );
  }

  Widget _buildSectionCard(String title, Widget content, Color bgColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          content,
        ],
      ),
    );
  }

  Widget _buildPreferenceOption(String label, String emoji, bool isSelected, Color activeColor) {
    return GestureDetector(
      onTap: () => setState(() => _selectedLookingFor = label),
      child: Container(
        width: 85,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? activeColor : Colors.white12,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? activeColor : Colors.white38,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowMeChip(String label, bool isSelected, Color activeColor) {
    return GestureDetector(
      onTap: () => setState(() => _selectedShowMe = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white12,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white38,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
