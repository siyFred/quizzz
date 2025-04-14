import 'dart:math';
import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(
    colors: [
      Color(0xFFE357E5), // Cor A: Roxo rosado
      Color(0xFF57E5C4), // Cor B: Verde água
    ],
    stops: [0.0, 1.0],
    transform: GradientRotation(2.13959913 * pi), // mesma rotação que você usava
  );
}
