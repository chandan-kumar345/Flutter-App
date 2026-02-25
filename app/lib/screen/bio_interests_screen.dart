import 'package:app/screen/preferences_screen.dart';
import 'package:flutter/material.dart';

class BioInterestsScreen extends StatefulWidget {
  const BioInterestsScreen({super.key});

  @override
  State<BioInterestsScreen> createState() => _BioInterestsScreenState();
}

class _BioInterestsScreenState extends State<BioInterestsScreen> {
  final TextEditingController _bioController = TextEditingController();

  final List<String> _selectedVibes = ["Travel", "Cooking", "Nature", "Wellness"];

  final List<Map<String, dynamic>> _allVibes = [
    {"name": "Travel", "icon": "✈️"},
    {"name": "Coffee", "icon": "☕"},
    {"name": "Music", "icon": "🎸"},
    {"name": "Cooking", "icon": "🍳"},
    {"name": "Cinema", "icon": "🎬"},
    {"name": "Fitness", "icon": "🏋️"},
    {"name": "Books", "icon": "📚"},
    {"name": "Nature", "icon": "🌿"},
    {"name": "Gaming", "icon": "🎮"},
    {"name": "Pets", "icon": "🐶"},
    {"name": "Art", "icon": "🎨"},
    {"name": "Wellness", "icon": "🧘"},
    {"name": "Wine", "icon": "🍷"},
    {"name": "Outdoors", "icon": "🏄"},
  ];

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

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
              /// Fixed Header and Progress Bar
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
                          "Step 3 of 4",
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
                        Expanded(child: _buildProgress(true, pinkAccent)),
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
                        const SizedBox(height: 20),
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
                                text: "Your bio\n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "& ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "interests",
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
                          "Let your personality do the talking.",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 32),

                        const Text(
                          "ABOUT ME",
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: TextField(
                            controller: _bioController,
                            maxLines: 4,
                            maxLength: 300,
                            decoration: const InputDecoration(
                              hintText: "Enter your bio here...",
                              hintStyle: TextStyle(color: Colors.white24),
                              border: InputBorder.none,
                              counterText: "",
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${_bioController.text.length} / 300",
                              style: const TextStyle(color: Colors.white38, fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Pick your vibe (choose up to 8)",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _allVibes.map((vibe) {
                            final isSelected = _selectedVibes.contains(vibe["name"]);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    _selectedVibes.remove(vibe["name"]);
                                  } else if (_selectedVibes.length < 8) {
                                    _selectedVibes.add(vibe["name"]);
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected ? pinkAccent : cardBg.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: isSelected ? Colors.transparent : Colors.white10,
                                    width: 1,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: pinkAccent.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          )
                                        ]
                                      : null,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      vibe["icon"],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      vibe["name"],
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.white38,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
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
                        MaterialPageRoute(builder: (context) => const PreferencesScreen()),
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
}
