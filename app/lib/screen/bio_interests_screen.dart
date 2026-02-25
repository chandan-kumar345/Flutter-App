import 'package:flutter/material.dart';

class BioInterestsScreen extends StatefulWidget {
  const BioInterestsScreen({super.key});

  @override
  State<BioInterestsScreen> createState() => _BioInterestsScreenState();
}

class _BioInterestsScreenState extends State<BioInterestsScreen> {
  final TextEditingController _bioController = TextEditingController(
    text: "Coffee addict ☕ | Amateur chef who loves hiking and spontaneous travel plans. Looking for someone who makes life an adventure! ✨",
  );

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
                        "Step 3 of 4",
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
                  Expanded(child: _buildProgressSegment(true, pinkAccent)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildProgressSegment(true, pinkAccent)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildProgressSegment(true, pinkAccent)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildProgressSegment(false, Colors.black12)),
                ],
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
                      text: "Your bio\n",
                      style: TextStyle(
                        color: darkText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "& ",
                      style: TextStyle(
                        color: darkText,
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
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ABOUT ME",
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2ECE4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _bioController,
                          maxLines: 4,
                          maxLength: 300,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
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
                            style: const TextStyle(color: Colors.black26, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Pick your vibe (choose up to 8)",
                        style: TextStyle(
                          color: darkText,
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
                                color: isSelected ? pinkAccent : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: isSelected ? Colors.transparent : Colors.black12,
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
                                      color: isSelected ? Colors.white : darkText,
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
                      const SizedBox(height: 100), // Space for button
                    ],
                  ),
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

  Widget _buildProgressSegment(bool filled, Color color) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
