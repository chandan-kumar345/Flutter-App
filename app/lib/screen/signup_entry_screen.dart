import 'package:app/screen/profile_setup_screen.dart';
import 'package:app/screen/signin_screen.dart';
import 'package:app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpEntryScreen extends StatelessWidget {
  const SignUpEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.darkBgGradientTop, AppColors.darkBgGradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(height: 20),
                
                /// Logo
                Center(
                  child: Image.asset(
                    'assets/images/finder_logo.png',
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.favorite, color: AppColors.pinkAccent, size: 60);
                    },
                  ),
                ),
                
                const SizedBox(height: 40),
                
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "Join Finder",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Create an account to start finding your perfect match today.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),

                /// Primary Option: Phone
                _buildAuthButton(
                  context,
                  label: "Continue with Phone Number",
                  icon: Icons.phone_android_rounded,
                  isPrimary: true,
                  onTap: () {
                    // This would lead to Phone Entry -> OTP -> Profile Setup
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
                    );
                  },
                ),

                const SizedBox(height: 16),

                /// Secondary Options
                _buildAuthButton(
                  context,
                  label: "Continue with Email",
                  icon: Icons.email_outlined,
                  onTap: () {},
                ),
                
                const SizedBox(height: 16),
                
                _buildAuthButton(
                  context,
                  label: "Continue with Google",
                  icon: Icons.g_mobiledata,
                  onTap: () {},
                ),
                
                const SizedBox(height: 16),
                
                _buildAuthButton(
                  context,
                  label: "Continue with Apple",
                  icon: Icons.apple,
                  onTap: () {},
                ),

                const Spacer(),

                /// Sign In Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    bool isPrimary = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.pinkAccent : AppColors.fieldBg.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: isPrimary ? null : Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: isPrimary 
            ? [BoxShadow(color: AppColors.pinkAccent.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))]
            : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
