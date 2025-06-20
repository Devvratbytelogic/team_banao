import 'package:flutter/material.dart';

/// Yeh enum define karta hai ki wave ka position kya hoga — top ya bottom
enum WavePosition { topLeft, bottomRight }

/// CustomWave ek reusable widget hai jo wave shape render karta hai top ya bottom mein
class CustomWave extends StatelessWidget {
  final WavePosition position; // Wave ka position
  final double width; // Wave container ki width
  final double height; // Wave container ki height
  final Color? color; // Solid color agar gradient na ho
  final Gradient? gradient; // Gradient background
  final double curveHeightFactor; // Wave ki height kitni upar niche hogi
  final double curveOffsetFactor; // Wave ki starting point horizontally

  const CustomWave({
    super.key,
    required this.position,
    required this.width,
    required this.height,
    this.color,
    this.gradient,
    this.curveHeightFactor = 0.3,
    this.curveOffsetFactor = 0.25,
  });

  @override
  Widget build(BuildContext context) {
    // Agar wave bottom mein render karni hai to flip lagayenge
    final isBottom = position == WavePosition.bottomRight;

    // Hamesha TopLeftWaveClipper use karenge (even for bottom — we'll flip it)
    final clipper = TopLeftWaveClipper(
      curveHeightFactor: curveHeightFactor,
      curveOffsetFactor: curveOffsetFactor,
    );

    // ClipPath ke andar container draw hoga jo wave shape mein dikhega
    Widget wave = ClipPath(
      clipper: clipper,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient, // Agar gradient mila to wahi use karo
          color: gradient == null ? color : null, // Gradient na ho to solid color fallback
        ),
      ),
    );

    // Agar wave bottom pe dikhani hai to usko vertical aur horizontal dono flip karo
    return isBottom
        ? Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(3.14159)..rotateY(3.14159), // Flip vertically & horizontally
      child: wave,
    )
        : wave; // Top wave normal render hoti hai
  }
}

/// Yeh custom clipper class ek top wave ka shape define karti hai
class TopLeftWaveClipper extends CustomClipper<Path> {
  final double curveHeightFactor;
  final double curveOffsetFactor;

  TopLeftWaveClipper({
    this.curveHeightFactor = 0.3,
    this.curveOffsetFactor = 0.25,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from top-left corner
    path.lineTo(0, size.height);

    // Pehla curve left se center tak
    path.quadraticBezierTo(
      size.width * curveOffsetFactor,
      size.height - (size.height * curveHeightFactor),
      size.width * (curveOffsetFactor + 0.25),
      size.height - (size.height * curveHeightFactor * 0.5),
    );

    // Doosra curve center se right tak
    path.quadraticBezierTo(
      size.width * (curveOffsetFactor + 0.5),
      size.height,
      size.width,
      size.height - (size.height * curveHeightFactor * 1.2),
    );

    // Top-right corner pe pahuch ke path close kar do
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
