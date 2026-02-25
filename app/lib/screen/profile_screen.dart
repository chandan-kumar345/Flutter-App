import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamic data simulated in a Map - easy to replace with a Model class later
    final Map<String, dynamic> userData = {
      "name": "yourname.vybe",
      "initial": "Y",
      "bio": "Digital creator & visual storyteller 🎨 capturing moments in light & shadow ✨",
      "link": "linkin.bio/yourname",
      "posts": "47",
      "followers": "8.2K",
      "following": "312",
      "highlights": [
        {"name": "NYC", "icon": "🗽", "color": Colors.cyan},
        {"name": "Travel", "icon": "✈️", "color": Colors.blue},
        {"name": "Studio", "icon": "🎨", "color": Colors.greenAccent},
        {"name": "Food", "icon": "🍜", "color": Colors.orangeAccent},
      ],
      "gridPosts": [
        Colors.deepPurple,
        Colors.pinkAccent,
        Colors.lightBlueAccent,
        Colors.greenAccent,
        Colors.orangeAccent,
        Colors.purpleAccent,
      ]
    };

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.pinkAccent, AppColors.purpleAccent],
                      ).createShader(bounds),
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        _buildHeaderIcon(Icons.settings),
                        const SizedBox(width: 12),
                        _buildHeaderIcon(Icons.menu),
                      ],
                    ),
                  ],
                ),
              ),

              /// Profile Info Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [AppColors.pinkAccent, AppColors.purpleAccent],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: const Color(0xFF1A1625),
                            child: Text(
                              userData["initial"],
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppColors.pinkAccent,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.pinkAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    _buildStatItem(userData["posts"], "Posts"),
                    const SizedBox(width: 24),
                    _buildStatItem(userData["followers"], "Followers"),
                    const SizedBox(width: 24),
                    _buildStatItem(userData["following"], "Following"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Name & Bio
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData["name"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userData["bio"],
                      style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.link, color: Colors.white38, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          userData["link"],
                          style: const TextStyle(color: Colors.cyanAccent, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Action Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.pinkAccent, AppColors.purpleAccent],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1625),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: const Center(
                          child: Text(
                            "Share Profile",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1625),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: const Icon(Icons.person_outline, color: AppColors.purpleAccent),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              /// Highlights
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: userData["highlights"].length,
                  itemBuilder: (context, index) {
                    final highlight = userData["highlights"][index];
                    return _buildHighlightItem(highlight["name"], highlight["icon"], highlight["color"]);
                  },
                ),
              ),

              const SizedBox(height: 12),
              const Divider(color: Colors.white10, thickness: 1),

              /// Tabs Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabIcon(Icons.grid_view_rounded, true),
                    _buildTabIcon(Icons.play_arrow_outlined, false),
                    _buildTabIcon(Icons.person_pin_outlined, false),
                  ],
                ),
              ),

              /// Posts Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userData["gridPosts"].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: userData["gridPosts"][index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1625),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Icon(icon, color: Colors.white70, size: 20),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildHighlightItem(String name, String icon, Color borderColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, bool isActive) {
    return Column(
      children: [
        Icon(icon, color: isActive ? AppColors.pinkAccent : Colors.white38, size: 28),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 2,
            width: 40,
            color: AppColors.pinkAccent,
          ),
      ],
    );
  }
}
