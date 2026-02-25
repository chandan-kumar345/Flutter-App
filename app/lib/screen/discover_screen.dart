import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color pinkAccent = Color(0xFFF76B8D);
    const Color purpleAccent = Color(0xFF9B51E0);
    const Color darkBg = Color(0xFF0C0910);

    // Simulated data for trending tags and explore grid
    final List<String> trendingTags = [
      "#urbanpulse",
      "#neonlights",
      "#rooftopvibes",
      "#digitalart",
      "#citygrid",
      "#chromaflow",
    ];

    final List<Color> exploreColors = [
      Colors.deepPurple,
      Colors.pink,
      Colors.cyan,
      Colors.green,
      Colors.orange,
      Colors.purple.shade200,
    ];

    return Scaffold(
      backgroundColor: darkBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [pinkAccent, purpleAccent],
                  ).createShader(bounds),
                  child: const Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// Search Bar
                TextField(
                  style: const TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "Search people, tags, places...",
                    hintStyle: const TextStyle(color: Colors.white38),
                    prefixIcon: const Icon(Icons.search, color: Colors.white38),
                    filled: true,
                    fillColor: const Color(0xFF1A1625),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                /// Trending Section
                const Text(
                  "TRENDING",
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: trendingTags.map((tag) => _buildHashtagChip(tag)).toList(),
                ),
                const SizedBox(height: 32),

                /// Explore Section
                const Text(
                  "EXPLORE",
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),

                // Manual Staggered Grid
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildExploreTile(exploreColors[0], height: 250),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _buildExploreTile(exploreColors[1], height: 121),
                          const SizedBox(height: 8),
                          _buildExploreTile(exploreColors[2], height: 121),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildExploreTile(exploreColors[3], height: 121),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildExploreTile(exploreColors[4], height: 121),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildExploreTile(exploreColors[5], height: 121),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHashtagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1625),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }

  Widget _buildExploreTile(Color color, {double height = 120}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}