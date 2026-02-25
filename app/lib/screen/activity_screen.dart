import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated dynamic data for notifications
    final List<Map<String, dynamic>> newActivities = [
      {
        "user": "neon.kai",
        "initial": "K",
        "action": "liked your photo",
        "time": "just now",
        "isUnread": true,
        "avatarColor": const Color(0xFF1E3A3A),
        "initialColor": const Color(0xFF4FD1C5),
      },
      {
        "user": "solxr",
        "initial": "S",
        "action": "started following you",
        "time": "3m ago",
        "isUnread": true,
        "avatarColor": const Color(0xFF3D2B2E),
        "initialColor": const Color(0xFFF687B3),
      },
      {
        "user": "voidmarch",
        "initial": "V",
        "action": "commented: \"fire shot 🔥\"",
        "time": "12m ago",
        "isUnread": true,
        "avatarColor": const Color(0xFF2D3748),
        "initialColor": const Color(0xFF63B3ED),
      },
    ];

    final List<Map<String, dynamic>> earlierActivities = [
      {
        "user": "prism.lx",
        "initial": "P",
        "action": "liked your reel",
        "time": "28m ago",
        "isUnread": false,
        "avatarColor": const Color(0xFF2D2E1E),
        "initialColor": const Color(0xFFD6BCFA),
      },
      {
        "user": "lux.io",
        "initial": "L",
        "action": "mentioned you in a story",
        "time": "1h ago",
        "isUnread": false,
        "avatarColor": const Color(0xFF1A202C),
        "initialColor": const Color(0xFFA0AEC0),
      },
      {
        "user": "aurora_v",
        "initial": "A",
        "action": "started following you",
        "time": "2h ago",
        "isUnread": false,
        "avatarColor": const Color(0xFF4A1D1D),
        "initialColor": const Color(0xFFFC8181),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [AppColors.pinkAccent, AppColors.purpleAccent],
                    ).createShader(bounds),
                    child: const Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mark all read',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  /// NEW Section
                  _buildSectionHeader("NEW"),
                  ...newActivities.map((activity) => _buildActivityItem(activity)),

                  const SizedBox(height: 24),

                  /// EARLIER Section
                  _buildSectionHeader("EARLIER"),
                  ...earlierActivities.map((activity) => _buildActivityItem(activity)),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: activity['isUnread'] ? AppColors.pinkAccent : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: activity['avatarColor'],
            child: Text(
              activity['initial'],
              style: TextStyle(
                color: activity['initialColor'],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                    children: [
                      TextSpan(
                        text: activity['user'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: activity['action'],
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  activity['time'],
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          if (activity['isUnread'])
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFF76B8D),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
