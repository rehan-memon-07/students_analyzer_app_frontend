import 'package:flutter/material.dart';

class ResponsiveHelper {
  /// Screen size breakpoints
  static const double mobileMax = 600;      // Phone: 0-600dp
  static const double tabletMin = 600;      // Tablet: 600-1200dp
  static const double tabletMax = 1200;
  static const double desktopMin = 1200;    // Web: 1200dp+

  /// Get device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileMax) return DeviceType.mobile;
    if (width < desktopMin) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  /// Helper to check if is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMax;

  /// Helper to check if is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMin &&
      MediaQuery.of(context).size.width < desktopMin;

  /// Helper to check if is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopMin;

  /// Get responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileMax) return const EdgeInsets.all(16);
    if (width < desktopMin) return const EdgeInsets.all(24);
    return const EdgeInsets.all(32);
  }

  /// Get responsive font size
  static double getResponsiveFontSize(BuildContext context, double baseSizePixel) {
    final width = MediaQuery.of(context).size.width;
    // Scale based on screen width
    return baseSizePixel * (width / 375); // 375 is standard mobile width
  }

  /// Get responsive spacing
  static double getResponsiveSpacing(BuildContext context, double baseSpacing) {
    return getResponsiveFontSize(context, baseSpacing);
  }

  /// Get container width for responsive layouts
  static double getContainerWidth(BuildContext context, {double maxWidth = 600}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > maxWidth ? maxWidth : screenWidth - 32;
  }

  /// Get grid columns based on screen size
  static int getGridColumns(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }
}

enum DeviceType { mobile, tablet, desktop }
