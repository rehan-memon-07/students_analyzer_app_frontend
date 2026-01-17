import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
    Future.delayed(const Duration(seconds: 3), _navigateNext);
  }

  void _navigateNext() {
    context.go('/onboarding');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveHelper.getDeviceType(context);
    final iconSize = ResponsiveHelper.getResponsiveFontSize(context, 48);
    final containerSize = ResponsiveHelper.getResponsiveFontSize(context, 80);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primaryBlue,
              AppTheme.primaryBlue.withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        Container(
                          width: containerSize,
                          height: containerSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              ResponsiveHelper.getResponsiveFontSize(context, 20),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.trending_up,
                              size: iconSize,
                              color: AppTheme.primaryGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.getResponsivePadding(context).left,
                          ),
                          child: Text(
                            'Your Career,',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                              fontSize:
                                  ResponsiveHelper.getResponsiveFontSize(context, 32),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.getResponsivePadding(context).left,
                          ),
                          child: Text(
                            'Accelerated.',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                              fontSize:
                                  ResponsiveHelper.getResponsiveFontSize(context, 32),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.getResponsivePadding(context).left,
                          ),
                          child: Text(
                            'Platform for Students',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white70,
                              fontSize:
                                  ResponsiveHelper.getResponsiveFontSize(context, 16),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
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
