import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/onboarding/presentation/pages/onboarding_page.dart';

class OnboardingCard extends StatefulWidget {
  final OnboardingContent content;

  const OnboardingCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = ResponsiveHelper.getResponsiveFontSize(context, 80);
    final titleSize = ResponsiveHelper.getResponsiveFontSize(context, 36);
    final descSize = ResponsiveHelper.getResponsiveFontSize(context, 17);
    final horizontalPadding =
        ResponsiveHelper.getResponsivePadding(context).left;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget.content.color,
            widget.content.color.withOpacity(0.6),
          ],
        ),
      ),
      child: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decorative Background Circles
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 200),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 200),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 140),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 140),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Icon Container
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 100),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 100),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          widget.content.icon,
                          size: iconSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 56),
                ),
                // Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    widget.content.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: titleSize,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 20),
                ),
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding + 8),
                  child: Text(
                    widget.content.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      height: 1.7,
                      fontSize: descSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
