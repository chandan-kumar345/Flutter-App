import 'package:app/screen/profile_screen.dart';
import 'package:app/screen/vybe_home_content.dart';
import 'package:app/screen/discover_screen.dart';
import 'package:flutter/material.dart';

import 'activity_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    VybeHomeContent(),
    _PlaceholderPage(title: 'REELS'),
    _PlaceholderPage(title: 'CREATE'),
    DiscoverScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color darkBg = Color(0xFF0C0910);
    const Color navBarColor = Color(0xFF13101D);
    const Color pinkPrimary = Color(0xFFF76B8D);
    const Color purpleSecondary = Color(0xFF9B51E0);

    // Get the bottom padding to avoid overlap with system navigation bar
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: darkBg,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        // Add safe area padding to the bottom margin
        margin: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottomPadding),
        height: 72, // Reduced height
        decoration: BoxDecoration(
          color: navBarColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white10, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_outlined, 'HOME', _selectedIndex == 0),
            _buildNavItem(1, Icons.movie_outlined, 'REELS', _selectedIndex == 1),
            _buildCreateItem(2, _selectedIndex == 2, pinkPrimary, purpleSecondary),
            _buildNavItem(3, Icons.search, 'SEARCH', _selectedIndex == 3),
            _buildNavItem(4, Icons.person_outline, 'PROFILE', _selectedIndex == 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, bool isSelected, {bool hasBadge = false}) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: isSelected ? const Color(0xFF9E8AFF) : Colors.white38,
                  size: 24, // Slightly smaller icon
                ),
                if (hasBadge)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF9E8AFF) : Colors.white38,
                fontSize: 9, // Slightly smaller font
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateItem(int index, bool isSelected, Color startColor, Color endColor) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        width: 58, // Reduced width
        height: 58, // Reduced height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: startColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.white, size: 24),
            Text(
              'CREATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String title;
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 1.5,
          colors: [
            Color(0xFF1B1429),
            Color(0xFF0C0910),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Georgia',
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'TAP A BUTTON BELOW',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 14,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
