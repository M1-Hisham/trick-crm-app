import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../core/helpers/shaerd_pref_helper.dart';
import '../../core/resources/resources.dart';
import '../../core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<Offset> _logoAnimation;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  /// initlizetion of the splash screen
  void initialization() async {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOut,
      ),
    );

    Timer(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });

    Timer(const Duration(milliseconds: 1000), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 2500), () {
      _checkLoginStatus();
    });
  }

  /// check if the user is logged in or not
  Future<void> _checkLoginStatus() async {
    final String? token = await SharedPrefHelper.getSecuredString('auth_token');
    log('_checkLoginStatus token: $token');
    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(RoutesNames.home);
    } else {
      Get.offAllNamed(RoutesNames.login);
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned.fill(
                child: CustomPaint(
                  painter: BluePainter(animationValue: _animation.value),
                  foregroundPainter:
                      BluePainter(animationValue: _animation.value),
                ),
              );
            },
          ),
          SlideTransition(
            position: _logoAnimation,
            child: Center(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  R.icons.logo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BluePainter extends CustomPainter {
  final double animationValue;

  BluePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = R.colors.primaryColor
      ..style = PaintingStyle.fill;

    double height = size.height * (1 - animationValue);
    double curveHeight = -90;

    Path path = Path();
    path.moveTo(0, height);
    path.quadraticBezierTo(
      size.width / 2,
      height - curveHeight,
      size.width,
      height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
