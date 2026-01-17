import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/constants/strings.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/auth/presentation/widgets/auth_form.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = ResponsiveHelper.getResponsivePadding(context).left;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Logo Section - Responsive height
              SizedBox(
                height: screenHeight * 0.15,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isMobile ? 60 : 80,
                        height: isMobile ? 60 : 80,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.trending_up,
                            size: isMobile ? 36 : 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Career Analyzer',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: isMobile ? null : 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Auth Form - Responsive padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    // Tab Selection
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.borderGray.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isLogin = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: _isLogin ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: _isLogin
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.05),
                                            blurRadius: 8,
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: _isLogin ? AppTheme.textDark : AppTheme.neutralGray,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isLogin = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: !_isLogin ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: !_isLogin
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.05),
                                            blurRadius: 8,
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: !_isLogin ? AppTheme.textDark : AppTheme.neutralGray,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Auth Form
                    AuthForm(isLogin: _isLogin),
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
