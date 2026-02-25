import 'package:app/screen/activity_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class VybeHomeContent extends StatelessWidget {
  const VybeHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated Dynamic Data
    final List<Map<String, String>> stories = [
      {"name": "Your story", "initial": "+", "isMe": "true"},
      {"name": "aurora_v", "initial": "A"},
      {"name": "neon.kai", "initial": "K"},
      {"name": "prism.lx", "initial": "P"},
      {"name": "voidmarch", "initial": "V"},
      {"name": "soul.r", "initial": "S"},
    ];

    final List<Map<String, String>> posts = [
      {
        "user": "aurora_v",
        "initial": "A",
        "time": "2m ago",
        "color": "0xFF6E56FF"
      },
      {
        "user": "neon.kai",
        "initial": "K",
        "time": "15m ago",
        "color": "0xFFF76B8D"
      },
      {
        "user": "prism.lx",
        "initial": "P",
        "time": "1h ago",
        "color": "0xFF9B51E0"
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/finder_logo.png', // Correct path to your new logo
                    height: 40,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback text if image not found
                      return ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.pinkAccent, AppColors.purpleAccent],
                        ).createShader(bounds),
                        child: const Text(
                          'Finder',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      // const SizedBox(width: 16),
                      // _buildHeaderIcon(Icons.mail, Colors.white),
                      _buildHeaderIcon(
                        Icons.favorite,
                        AppColors.pinkAccent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ActivityScreen(),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// Stories Horizontal List
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length,
                        itemBuilder: (context, index) {
                          final story = stories[index];
                          return _buildStoryItem(
                            story["name"]!,
                            story["initial"]!,
                            story["isMe"] == "true",
                            AppColors.pinkAccent,
                            AppColors.purpleAccent,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Posts Vertical Feed
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return _buildPostItem(
                          post["user"]!,
                          post["initial"]!,
                          post["time"]!,
                          Color(int.parse(post["color"]!)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, Color iconColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1625),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  Widget _buildStoryItem(String name, String initial, bool isMe, Color startColor, Color endColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isMe
                  ? null
                  : LinearGradient(colors: [startColor, endColor]),
              border: isMe ? Border.all(color: Colors.white24, style: BorderStyle.none) : null,
            ),
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: isMe ? Colors.transparent : const Color(0xFF0C0910),
                shape: BoxShape.circle,
                border: isMe ? Border.all(color: Colors.white24, width: 1.5, style: BorderStyle.none) : null,
              ),
              child: isMe
                  ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, style: BorderStyle.solid),
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: const TextStyle(color: Colors.white70, fontSize: 24),
                  ),
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [startColor.withOpacity(0.6), endColor.withOpacity(0.6)],
                  ),
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(String user, String initial, String time, Color contentColor) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: contentColor.withOpacity(0.2),
                child: Text(
                  initial,
                  style: TextStyle(color: contentColor, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Colors.white38),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 400,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [contentColor.withOpacity(0.8), contentColor.withOpacity(0.4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white.withOpacity(0.5),
              size: 64,
            ),
          ),
        ),
      ],
    );
  }
}
