import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/auth/data/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
