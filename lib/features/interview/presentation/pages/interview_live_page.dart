import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/interview/presentation/providers/interview_provider.dart';

import '../../../session/session_provider.dart';
import '../../domain/entities/interview_entities.dart';

class InterviewLivePage extends ConsumerStatefulWidget {
  const InterviewLivePage({Key? key}) : super(key: key);

  @override
  ConsumerState<InterviewLivePage> createState() => _InterviewLivePageState();
}

class _InterviewLivePageState extends ConsumerState<InterviewLivePage>
    with SingleTickerProviderStateMixin {
  late TextEditingController _answerController;
  late AnimationController _timerController;
  late Stopwatch _stopwatch;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    _timerController = AnimationController(
      duration: const Duration(minutes: 5),
      vsync: this,
    );
    _stopwatch = Stopwatch()..start();
    _timerController.forward();
  }

  @override
  void dispose() {
    _answerController.dispose();
    _timerController.dispose();
    _stopwatch.stop();
    super.dispose();
  }

  Future<void> _handleSubmitAnswer() async {
    final session = ref.read(currentInterviewSessionProvider)!;
    final currentIndex = ref.read(currentQuestionIndexProvider);

    if (_answerController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please provide an answer')));
      return;
    }

    // Save answer to current question
    final updatedQuestions = List<InterviewQuestion>.from(session.questions);

    updatedQuestions[currentIndex] = updatedQuestions[currentIndex].copyWith(
      userAnswer: _answerController.text,
      answered: true,
    );

    final isLastQuestion = currentIndex + 1 >= session.totalQuestions;

    if (isLastQuestion) {
      // ✅ Create updated session (immutable style)
      final updatedSession = session.copyWith(questions: updatedQuestions);

      // ✅ Explicitly pass everything
      await _handleEndInterview(updatedSession, updatedQuestions);
      return;
    }

    // Otherwise call next question
    final repository = ref.read(interviewRepositoryProvider);

    final nextQuestion = await repository.getNextQuestion(
      previousQuestion: session.questions[currentIndex].text,
      answer: _answerController.text,
    );

    updatedQuestions.add(
      InterviewQuestion(
        id: "q_${currentIndex + 1}",
        text: nextQuestion,
        userAnswer: null,
        answered: false,
      ),
    );

    ref.read(currentInterviewSessionProvider.notifier).state = session.copyWith(
      questions: updatedQuestions,
    );

    ref.read(currentQuestionIndexProvider.notifier).state = currentIndex + 1;

    _answerController.clear();
  }

  Future<void> _handleEndInterview(
    InterviewSession session,
    List<InterviewQuestion> finalQuestions,
  ) async {
    try {
      final sessionToken = await ref.read(ensureSessionProvider.future);

      final repository = ref.read(interviewRepositoryProvider);

      final conversation = finalQuestions
          .where((q) => q.userAnswer != null && q.userAnswer!.isNotEmpty)
          .map((q) => {"question": q.text, "answer": q.userAnswer!})
          .toList();

      if (conversation.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No answers submitted yet')),
        );
        return;
      }

      final result = await repository.endInterview(
        sessionToken: sessionToken,
        conversation: conversation,
        role: session.jobRole,
      );

      final evaluation = result["evaluation"];

      final interviewResult = InterviewResult(
        sessionId: session.sessionId,
        jobRole: session.jobRole,
        difficulty: session.difficulty,
        totalScore: evaluation["overallScore"] ?? 0,
        difficultyScore: evaluation["technicalDepthScore"] ?? 0,
        confidenceScore: evaluation["confidenceScore"] ?? 0,
        overallFeedback: evaluation["finalVerdict"] ?? "",
        completedAt: DateTime.now(),
        feedbackItems: [],
      );

      ref.read(interviewResultsProvider.notifier).state = interviewResult;

      if (mounted) {
        context.go('/interview/results');
      }
    } catch (e) {
      debugPrint("End interview error: $e");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to generate evaluation')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final sessionAsync = ref.watch(currentInterviewSessionProvider);
    final currentIndex = ref.watch(currentQuestionIndexProvider);

    if (sessionAsync == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final session = sessionAsync;
    final currentQuestion = session.questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFE1E9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1E9F6),
        elevation: 0,
        title: Text(
          'MOCK INTERVIEW',
          style: TextStyle(
            color: Colors.black,
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(60, 36),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('End Interview?'),
                    content: const Text(
                      'Are you sure you want to end this interview?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          final session = ref.read(
                            currentInterviewSessionProvider,
                          );
                          if (session == null) return;

                          Navigator.pop(context);

                          await _handleEndInterview(session, session.questions);
                        },
                        child: const Text('End Interview'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('End'),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getResponsiveSpacing(context, 16),
              vertical: ResponsiveHelper.getResponsiveSpacing(context, 8),
            ),
            child: Center(
              child: Text(
                '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: responsivePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Question Counter
                Text(
                  'Question ${currentIndex + 1} of ${session.questions.length}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                      context,
                      12,
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                ),

                /// Question Card
                Container(
                  padding: responsivePadding,
                  decoration: BoxDecoration(
                    color: Colors.white, // ✅ FIXED
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    currentQuestion.text,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black, // ✅ FIXED
                      fontSize: ResponsiveHelper.getResponsiveFontSize(
                        context,
                        18,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),

                /// Recording Row
                Row(
                  children: [
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(
                        context,
                        12,
                      ),
                      height: ResponsiveHelper.getResponsiveFontSize(
                        context,
                        12,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                    ),
                    Text(
                      'RECORDING',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          12,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),

                /// Answer Input
                TextField(
                  controller: _answerController,
                  maxLines: isMobile ? 4 : 5,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black, // ✅ FIXED
                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                      context,
                      14,
                    ),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tap to finish answer',
                    hintStyle: TextStyle(
                      color: Colors.grey, // ✅ FIXED
                      fontSize: ResponsiveHelper.getResponsiveFontSize(
                        context,
                        14,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white, // ✅ FIXED
                  ),
                ),

                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),

                /// Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.mic),
                        label: const Text('Mic'),
                        onPressed: () {
                          setState(() => _isRecording = !_isRecording);
                        },
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.videocam),
                        label: const Text('Video'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next Question'),
                    onPressed: _handleSubmitAnswer,
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
