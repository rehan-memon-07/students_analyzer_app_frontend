import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/features/splash/presentation/pages/splash_page.dart';
import 'package:student_analyzer_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:student_analyzer_app/features/auth/presentation/pages/auth_page.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:student_analyzer_app/features/resume/presentation/pages/resume_upload_page.dart';
import 'package:student_analyzer_app/features/resume/presentation/pages/resume_analysis_page.dart';
import 'package:student_analyzer_app/features/interview/presentation/pages/interview_setup_page.dart';
import 'package:student_analyzer_app/features/interview/presentation/pages/interview_live_page.dart';
import 'package:student_analyzer_app/features/interview/presentation/pages/interview_results_page.dart';
import 'package:student_analyzer_app/features/interview/presentation/pages/interview_feedback_page.dart';
import 'package:student_analyzer_app/features/writing/presentation/pages/writing_assistant_page.dart';
import 'package:student_analyzer_app/features/planner/presentation/pages/career_planner_page.dart';
import 'package:student_analyzer_app/features/score_profile/presentation/pages/career_score_page.dart';
import 'package:student_analyzer_app/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:student_analyzer_app/features/leaderboard/presentation/pages/student_detail_page.dart';
import 'package:student_analyzer_app/features/settings/presentation/pages/settings_page.dart';

final appRouterProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // TODO: Integrate real auth state check here
      // For now, always allow splash to handle routing
      return null;
    },
    routes: [
      // Splash and Onboarding
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // Auth
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),

      // Main Navigation
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),

      // Resume Flow
      GoRoute(
        path: '/resume/upload',
        builder: (context, state) => const ResumeUploadPage(),
      ),
      //GoRoute(
       // path: '/resume/analysis',
        //builder: (context, state) => const ResumeAnalysisPage(),
      //),

      // Interview Flow
      GoRoute(
        path: '/interview/setup',
        builder: (context, state) => const InterviewSetupPage(),
      ),
      GoRoute(
        path: '/interview/live',
        builder: (context, state) => const InterviewLivePage(),
      ),
      GoRoute(
        path: '/interview/results',
        builder: (context, state) => const InterviewResultsPage(),
      ),
      GoRoute(
        path: '/interview/feedback',
        builder: (context, state) => const InterviewFeedbackPage(),
      ),

      // Writing Assistant
      GoRoute(
        path: '/writing',
        builder: (context, state) => const WritingAssistantPage(),
      ),

      // Career Planner
      GoRoute(
        path: '/planner',
        builder: (context, state) => const CareerPlannerPage(),
      ),

      // Career Score
      GoRoute(
        path: '/score',
        builder: (context, state) => const CareerScorePage(),
      ),

      // Leaderboard
      GoRoute(
        path: '/leaderboard',
        builder: (context, state) => const LeaderboardPage(),
      ),
      GoRoute(
        path: '/leaderboard/student/:studentId',
        builder: (context, state) {
          final studentId = state.pathParameters['studentId']!;
          return StudentDetailPage(studentId: studentId);
        },
      ),

      // Settings
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
});

// Auth state provider - placeholder for real auth integration
// TODO: Replace with real authentication service
final authStateProvider = StateProvider<AuthState>((ref) {
  return AuthState.unauthenticated();
});

class AuthState {
  final bool isAuthenticated;
  final String? userId;
  final String? userRole; // 'student' or 'admin'

  AuthState({
    required this.isAuthenticated,
    this.userId,
    this.userRole,
  });

  factory AuthState.authenticated({
    required String userId,
    required String userRole,
  }) {
    return AuthState(
      isAuthenticated: true,
      userId: userId,
      userRole: userRole,
    );
  }

  factory AuthState.unauthenticated() {
    return AuthState(isAuthenticated: false);
  }
}
