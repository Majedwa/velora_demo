// lib/core/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary colors based on the logo
  static const Color primary = Color(0xFF0F9D58); // Green from the logo
  static const Color secondary = Color(0xFFFF4B4B); // Red from the logo
  static const Color tertiary = Color(0xFF3E83FF); // Blue accent
  
  // Background and surface colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  
  // Status colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFEEEEEE);
  
  // Other UI elements
  static const Color divider = Color(0xFFE0E0E0);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color card = Color(0xFFFFFFFF);
  static const Color shadow = Color(0x1A000000);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF00796B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, Color(0xFFE53935)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}