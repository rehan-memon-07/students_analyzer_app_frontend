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
  late PageController _pageController;
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
    // TODO: Mark onboarding as completed in local storage
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
    final isTablet = ResponsiveHelper.isTablet(context);
    final buttonHeight = ResponsiveHelper.getResponsiveFontSize(context, 48);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingCard(content: _pages[index]);
            },
          ),
          // Top Skip Button
          Positioned(
            top: ResponsiveHelper.getResponsiveSpacing(context, 48),
            right: ResponsiveHelper.getResponsiveSpacing(context, 24),
            child: TextButton(
              onPressed: _handleSkip,
              child: Text(
                Strings.skip,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.neutralGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsivePadding.left,
                vertical: ResponsiveHelper.getResponsiveSpacing(context, 32),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ResponsiveHelper.getResponsiveSpacing(context, 6),
                        ),
                        width: _currentPage == index ? 32 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppTheme.primaryBlue
                              : AppTheme.borderGray,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                  ),
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: _handleNext,
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? Strings.continueButton
                            : Strings.continueButton,
                        style: TextStyle(
                          fontSize:
                              ResponsiveHelper.getResponsiveFontSize(context, 16),
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
