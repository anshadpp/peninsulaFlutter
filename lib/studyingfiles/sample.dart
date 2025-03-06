import 'package:flutter/material.dart';


class PeninsulaLoginPage extends StatefulWidget {
  const PeninsulaLoginPage({super.key});

  @override
  State<PeninsulaLoginPage> createState() => _PeninsulaLoginPageState();
}

class _PeninsulaLoginPageState extends State<PeninsulaLoginPage> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We can make the entire screen a gradient background.
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF028F77), // Customize these colors
              Color(0xFF047AAC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // SafeArea ensures we don’t overlap the system UI (notch, status bar).
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button at the top
                InkWell(
                  onTap: () {
                    // Handle "Back" logic (e.g., Navigator.pop)
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Back', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // App/Brand Logo & Name
                // Replace with Image.asset(...) if you have a logo asset
                Center(
                  child: Column(
                    children: [
                      // Example placeholder icon/logo
                      Icon(Icons.home_work, size: 60, color: Colors.white),
                      const SizedBox(height: 8),
                      const Text(
                        'Peninsula',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // Login "Card" (semi-transparent)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Username / Email ID TextField
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Username / Email ID',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password TextField
                      TextField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Remember me & Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: Colors.white70,
                                ),
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _rememberMe = newValue ?? false;
                                    });
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.green,
                                ),
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle "Forgot Password?" logic
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.white70,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00B686),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Handle login logic here
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Or Log In With
                Center(
                  child: Text(
                    'Or Log In With',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
                const SizedBox(height: 16),

                // Social Login Icons (Google, Apple, Facebook)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // For actual Google/Apple/Facebook icons, you can use
                    // packages like font_awesome_flutter or custom images.
                    IconButton(
                      onPressed: () {
                        // Handle Google login
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      iconSize: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      onPressed: () {
                        // Handle Apple login
                      },
                      icon: const Icon(Icons.apple),
                      iconSize: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      icon: const Icon(Icons.facebook),
                      iconSize: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
