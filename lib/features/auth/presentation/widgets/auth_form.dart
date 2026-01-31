import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/constants/strings.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';

import '../providers/auth_provider.dart';

class AuthForm extends ConsumerStatefulWidget {
  final bool isLogin;

  const AuthForm({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleEmailAuth() {
    // TODO: Call real authentication API via AuthRepository
    setState(() => _isLoading = true);

    // Simulate network request
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
      // Mock successful login
      context.go('/dashboard');
    });
  }

  Future<void> _handleGoogleAuth() async {
    setState(() => _isLoading = true);

    try {
      await ref.read(authServiceProvider).signInWithGoogle();

      if (!mounted) return;

      context.go('/dashboard'); // navigate after success
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }


  void _handleCollegeAuth() {
    // TODO: Integrate College ID authentication
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('College ID Auth - TODO: Implement with backend')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Input
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: Strings.emailLabel,
            prefixIcon: Icon(Icons.email_outlined, color: AppTheme.neutralGray),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        // Name Input (Sign Up only)
        if (!widget.isLogin) ...[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'Full Name',
              prefixIcon: Icon(Icons.person_outlined, color: AppTheme.neutralGray),
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Password Input
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: Strings.passwordLabel,
            prefixIcon: Icon(Icons.lock_outline, color: AppTheme.neutralGray),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.neutralGray,
              ),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Forgot Password (Login only)
        if (widget.isLogin)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to forgot password flow
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Forgot Password - TODO: Implement')),
                );
              },
              child: Text(
                Strings.forgotPassword,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        const SizedBox(height: 24),

        // Email Auth Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleEmailAuth,
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(widget.isLogin ? Strings.loginButton : Strings.signupButton),
          ),
        ),
        const SizedBox(height: 24),

        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: AppTheme.borderGray)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Or',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(child: Divider(color: AppTheme.borderGray)),
          ],
        ),
        const SizedBox(height: 24),

        // Google Auth Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Icon(
              Icons.g_mobiledata,
              color: AppTheme.primaryBlue,
              size: 28,
            ),
            label: const Text('Continue with Google'),
            onPressed: _handleGoogleAuth,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: BorderSide(color: AppTheme.primaryBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // College ID Auth Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Icon(Icons.school, color: AppTheme.primaryBlue),
            label: const Text('Login with College ID'),
            onPressed: _handleCollegeAuth,
          ),
        ),
      ],
    );
  }
}
