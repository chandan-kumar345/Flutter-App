import 'dart:math' as math;
import 'package:app/screen/profile_setup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BloomApp());
}

class BloomApp extends StatelessWidget {
  const BloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia', // fallback; use Google Fonts in real project
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  WELCOME SCREEN
// ─────────────────────────────────────────────────────────────
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _fadeController;
  late Animation<double> _floatAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    // Floating hearts animation
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(begin: 0, end: -14).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // Fade-in on load
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _fadeAnim = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.4),
            radius: 1.2,
            colors: [
              Color(0xFF2D1040), // deep plum center
              Color(0xFF180B28),
              Color(0xFF0C0812), // near black edge
            ],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: SafeArea(
            child: Column(
              children: [
                // ── Top section: logo + cards ──────────────
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      // Ambient glow blobs
                      Positioned(
                        top: -40,
                        right: -60,
                        child: _GlowBlob(
                          color: const Color(0xFFFF6B8A).withOpacity(0.18),
                          size: 260,
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: -50,
                        child: _GlowBlob(
                          color: const Color(0xFFE8C46A).withOpacity(0.12),
                          size: 180,
                        ),
                      ),

                      Column(
                        children: [
                          const SizedBox(height: 32),

                          // ── Logo ─────────────────────────
                          const _BloomLogo(),

                          const SizedBox(height: 8),

                          // ── Tagline ───────────────────────
                          const Text(
                            'WHERE HEARTS FIND HOME',
                            style: TextStyle(
                              fontSize: 11,
                              letterSpacing: 3.5,
                              color: Color(0x72F0E8FF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          const SizedBox(height: 32),

                          // ── Card Stack ───────────────────
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _floatAnim,
                              builder: (_, __) => _CardStack(
                                floatOffset: _floatAnim.value,
                              ),
                            ),
                          ),

                          // ── Sparkle ───────────────────────
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              bottom: 16,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AnimatedBuilder(
                                animation: _floatController,
                                builder: (_, __) => Opacity(
                                  opacity:
                                  0.4 + 0.6 * _floatController.value,
                                  child: const Text(
                                    '✦',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFE8C46A),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── Bottom CTA section ──────────────────────
                const _BottomActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  BLOOM LOGO
// ─────────────────────────────────────────────────────────────
class _BloomLogo extends StatelessWidget {
  const _BloomLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/finder_logo.png',
      height: 80,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Finder',
                style: TextStyle(
                  fontSize: 52,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -2,
                  height: 1,
                  shadows: [
                    Shadow(
                      color: const Color(0xFFFF6B8A).withOpacity(0.4),
                      blurRadius: 24,
                    ),
                  ],
                ),
              ),
              const TextSpan(
                text: '.',
                style: TextStyle(
                  fontSize: 52,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFF6B8A),
                  height: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  FLOATING CARD STACK
// ─────────────────────────────────────────────────────────────
class _CardStack extends StatelessWidget {
  const _CardStack({required this.floatOffset});

  final double floatOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Card 1 – Left (Lavender/Rose)
          Transform.translate(            offset: Offset(-75, floatOffset * 0.7 + 10),
            child: Transform.rotate(
              angle: -0.20, // Approx -11 degrees
              child: _ProfileCard(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD49ECF), Color(0xFFE07080)],
                ),
                name: 'Simran',
                width: 150,
                height: 200,
              ),
            ),
          ),

          // Card 2 – Right (Sky/Ocean)
          Transform.translate(
            offset: Offset(75, floatOffset * 0.7 + 10),
            child: Transform.rotate(
              angle: 0.20, // Approx 11 degrees
              child: _ProfileCard(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFA0C8E0), Color(0xFF7098D8)],
                ),
                name: 'BBhumi',
                width: 150,
                height: 200,
              ),
            ),
          ),

          // Card 3 – Center (Peach/Sunset) - Placed last to be on top
          Transform.translate(
            offset: Offset(0, floatOffset),
            child: Transform.rotate(
              angle: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _ProfileCard(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF4C5A0), Color(0xFFE07A5F)],
                    ),
                    name: 'Chandu',
                    width: 150,
                    height: 200,
                  ),
                  // Small heart badge on right side
                  Positioned(
                    right: 60,
                    top: -50,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B8A),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:
                            const Color(0xFFFF6B8A).withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  SINGLE PROFILE CARD
// ─────────────────────────────────────────────────────────────
class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.gradient,
    required this.name,
    required this.width,
    required this.height,
  });

  final LinearGradient gradient;
  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.45),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Silhouette figure
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: _PersonSilhouette(
                cardWidth: width,
                cardHeight: height,
              ),
            ),
          ),

          // Name label
          Positioned(
            top: 20,
            bottom: 12,

            left: 50,
            right: 40,  // Set right to 0 to allow centering
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  PERSON SILHOUETTE (CSS-style, no images)
// ─────────────────────────────────────────────────────────────
class _PersonSilhouette extends StatelessWidget {
  const _PersonSilhouette({
    required this.cardWidth,
    required this.cardHeight,
  });

  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final bodyW = cardWidth * 0.60;
    final bodyH = cardHeight * 0.82;
    final headW = bodyW * 0.42;
    final headH = headW;

    return SizedBox(
      width: cardWidth,
      height: bodyH,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Body
          Positioned(
            bottom: 0,
            child: Container(
              width: bodyW,
              height: bodyH * 0.78,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(bodyW * 0.5),
                  topRight: Radius.circular(bodyW * 0.5),
                ),
              ),
            ),
          ),
          // Head
          Positioned(
            bottom: bodyH * 0.74,
            child: Container(
              width: headW,
              height: headH,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.22),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  BOTTOM CTA ACTIONS
// ─────────────────────────────────────────────────────────────
class _BottomActions extends StatelessWidget {
  const _BottomActions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Create My Profile button
          _GradientButton(
            label: 'Create My Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileSetupScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 18),

          // Divider
          Row(
            children: [
              Expanded(
                child: Container(height: 1, color: Colors.white.withOpacity(0.1)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'already have an account?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.38),
                  ),
                ),
              ),
              Expanded(
                child: Container(height: 1, color: Colors.white.withOpacity(0.1)),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Sign In button
          _OutlineButton(
            label: 'Sign In',
            onTap: () {},
          ),

          const SizedBox(height: 16),

          // Terms
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withOpacity(0.28),
                height: 1.5,
              ),
              children: [
                const TextSpan(text: 'By continuing you agree to our '),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Colors.white38,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' & '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white38,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  GRADIENT BUTTON (Create My Profile)
// ─────────────────────────────────────────────────────────────
class _GradientButton extends StatefulWidget {
  const _GradientButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFFF6B8A), Color(0xFFD94D6A)],
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B8A).withOpacity(0.45),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  OUTLINE / GHOST BUTTON (Sign In)
// ─────────────────────────────────────────────────────────────
class _OutlineButton extends StatefulWidget {
  const _OutlineButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.88),
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  GLOW BLOB HELPER
// ─────────────────────────────────────────────────────────────
class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        filter: ColorFilter.mode(color, BlendMode.plus),
        child: const SizedBox(),
      ),
    );
  }
}
