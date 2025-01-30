import 'package:flutter/material.dart';
import 'package:team_up/screens/signin_screen.dart';
import 'package:team_up/screens/signup_screen.dart';
import 'package:team_up/widgets/custom_scaffold.dart';
import 'package:team_up/widgets/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // ทำแอนิเมชัน fade in เล็กน้อย (0 -> 1)
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        // พื้นหลังไล่สีโทนส้ม
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFA726), // ส้มเข้ม
              Color(0xFFFFCC80), // ส้มอ่อน
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ส่วนภาพ + โลโก้
              Expanded(
                flex: 8,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ใส่รูปโลโก้
                        Image.asset(
                          'assets/images/Logo.png',
                          fit: BoxFit.contain,
                          height: 120,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Enter personal details\n to your employee account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ส่วนปุ่ม Sign in / Sign up
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    // ปุ่ม Sign in
                    Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign in',
                        onTap: const SignInScreen(),
                        color: Colors.transparent,
                        textColor: Colors.white,
                      ),
                    ),
                    // ปุ่ม Sign up
                    Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign up',
                        onTap: const SignUpScreen(),
                        color: Colors.white,
                        textColor: const Color(0xFFFFA726), // ส้ม
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
