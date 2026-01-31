import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/constants/strings.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/onboarding/presentation/widgets/onboarding_card.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      icon: Icons.description,
      title: Strings.onboardingResumeTitle,
      description: Strings.onboardingResumeDesc,
      color: AppTheme.primaryBlue,
    ),
    OnboardingContent(
      icon: Icons.videocam,
      title: Strings.onboardingInterviewTitle,
      description: Strings.onboardingInterviewDesc,
      color: AppTheme.primaryGreen,
    ),
    OnboardingContent(
      icon: Icons.edit,
      title: Strings.onboardingWritingTitle,
      description: Strings.onboardingWritingDesc,
      color: AppTheme.warningOrange,
    ),
    OnboardingContent(
      icon: Icons.map,
      title: Strings.onboardingPlannerTitle,
      description: Strings.onboardingPlannerDesc,
      color: AppTheme.primaryBlue,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleSkip() {
    context.go('/auth');
  }

  void _handleNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _handleSkip();
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final buttonHeight = ResponsiveHelper.getResponsiveFontSize(context, 56);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          /// ✅ FIXED PageView.builder
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return OnboardingCard(content: _pages[index]);
            },
          ),

          /// ✅ FIXED Skip Button (BackdropFilter is a WIDGET)
          Positioned(
            top: ResponsiveHelper.getResponsiveSpacing(context, 48),
            right: ResponsiveHelper.getResponsiveSpacing(context, 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                    onPressed: _handleSkip,
                    child: Text(
                      Strings.skip,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize:
                        ResponsiveHelper.getResponsiveFontSize(context, 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: responsivePadding.left,
                right: responsivePadding.right,
                top: ResponsiveHelper.getResponsiveSpacing(context, 24),
                bottom:
                ResponsiveHelper.getResponsiveSpacing(context, 32) +
                    bottomPadding,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Page Indicators
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                            horizontal:
                            ResponsiveHelper.getResponsiveSpacing(context, 5),
                          ),
                          width: _currentPage == index ? 28 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppTheme.primaryBlue
                                : AppTheme.borderGray.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 28),
                  ),

                  /// Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: _handleNext,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        Strings.continueButton,
                        style: TextStyle(
                          fontSize:
                          ResponsiveHelper.getResponsiveFontSize(context, 16),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Model
class OnboardingContent {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  OnboardingContent({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
